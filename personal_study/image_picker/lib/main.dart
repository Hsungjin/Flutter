import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/fullscreen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PhotoGalleryScreen(),
    );
  }
}

class PhotoGalleryScreen extends StatefulWidget {
  @override
  _PhotoGalleryScreenState createState() => _PhotoGalleryScreenState();
}

class _PhotoGalleryScreenState extends State<PhotoGalleryScreen> {
  List<AssetEntity> assets = [];
  List<AssetEntity> selectedAssets = [];
  Map<AssetEntity, Uint8List?> thumbnailDataMap = {};

  @override
  void initState() {
    super.initState();
    _fetchAssets();
  }

  Future<void> _fetchAssets() async {
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    if (ps.isAuth) {
      List<AssetPathEntity> albums =
          await PhotoManager.getAssetPathList(type: RequestType.image);
      List<AssetEntity> photos =
          await albums[0].getAssetListPaged(page: 0, size: 30000);
      for (var asset in photos) {
        final thumbnailData = await asset.thumbnailData;
        thumbnailDataMap[asset] = thumbnailData;
      }
      setState(() {
        assets = photos;
      });
    } else {
      PhotoManager.openSetting();
      await Permission.storage.request();
      if (await Permission.photos.isGranted) {
        print('123');
      } else if (await Permission.photos.isDenied) {
        print('456');
        openAppSettings();
      }

    }
  }

  void _onAssetTapped(AssetEntity asset) {
    setState(() {
      if (selectedAssets.contains(asset)) {
        selectedAssets.remove(asset);
      } else {
        if (selectedAssets.length < 4) {
          selectedAssets.add(asset);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('이미지는 최대 4개까지 선택할 수 있습니다.'),
          ));
        }
      }
    });
  }

  void _navigateToFullGallery(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullGalleryScreen(
          assets: assets,
          thumbnailDataMap: thumbnailDataMap,
          selectedAssets: selectedAssets,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        selectedAssets = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check, color: Colors.black),
            onPressed: () {
              for (var asset in selectedAssets) {
                debugPrint(asset.id);
              }
            },
          ),
        ],
      ),
      body: assets.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Stack(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: assets.map((asset) {
                          final thumbnailData = thumbnailDataMap[asset];
                          return GestureDetector(
                            onTap: () => _onAssetTapped(asset),
                            child: Stack(
                              children: [
                                thumbnailData != null
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3),
                                        child: Image.memory(thumbnailData,
                                            width: 160,
                                            height: 161,
                                            fit: BoxFit.cover),
                                      )
                                    : Container(
                                        width: 150,
                                        height: 150,
                                        child: Center(
                                            child:
                                                CircularProgressIndicator())),
                                Positioned(
                                  right: 12,
                                  top: 8,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color:
                                            Color(0xffFFFFFF).withOpacity(0.4),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Color(0xff202020)
                                                .withOpacity(0.12))),
                                  ),
                                ),
                                if (selectedAssets.contains(asset))
                                  Positioned.fill(
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color:
                                            Color(0xff2495EF).withOpacity(0.2),
                                        border: Border.all(
                                          color: Color(0xff2495EF),
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                if (selectedAssets.contains(asset))
                                  Positioned(
                                    right: 12,
                                    top: 8,
                                    width: 20,
                                    height: 20,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                        child: Image.asset('assets/check.png')),
                                  ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () => _navigateToFullGallery(context),
                    child: Row(
                      children: [
                        Image.asset('assets/full_gallery.png'),
                        Text('전체보기'),
                      ],
                    )),
              ],
            ),
    );
  }
}
