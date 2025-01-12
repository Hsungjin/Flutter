import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class FullGalleryScreen extends StatefulWidget {
  final List<AssetEntity> assets;
  final Map<AssetEntity, Uint8List?> thumbnailDataMap;
  final List<AssetEntity> selectedAssets;

  FullGalleryScreen({
    required this.assets,
    required this.thumbnailDataMap,
    required this.selectedAssets,
  });

  @override
  _FullGalleryScreenState createState() => _FullGalleryScreenState();
}

class _FullGalleryScreenState extends State<FullGalleryScreen> {
  late List<AssetEntity> selectedAssets;

  @override
  void initState() {
    super.initState();
    selectedAssets = List.from(widget.selectedAssets);
  }

  void _onAssetTapped(AssetEntity asset) {
    setState(() {
      if (selectedAssets.contains(asset)) {
        selectedAssets.remove(asset);
      } else {
        if (selectedAssets.length < 4) {
          selectedAssets.add(asset);
        }
        // else {
        //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        //     content: Text('이미지는 최대 4개까지 선택할 수 있습니다.'),
        //   ));
        // }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () => Navigator.pop(context, selectedAssets),
          ),
          IconButton(
            icon:
                const Icon(Icons.calendar_month_outlined, color: Colors.black),
            onPressed: () => Navigator.pop(context, selectedAssets),
          ),
          IconButton(
            icon: const Icon(Icons.message_sharp, color: Colors.black),
            onPressed: () => Navigator.pop(context, selectedAssets),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              '사진',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
          ),
          if (selectedAssets.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: selectedAssets.map((asset) {
                    final thumbnailData = widget.thumbnailDataMap[asset];
                    return Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: Color(0xff000000).withOpacity(0.08))),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            thumbnailData != null
                                ? Image.memory(thumbnailData,
                                    width: 65, height: 65, fit: BoxFit.cover)
                                : const CircularProgressIndicator(),
                            Positioned(
                              right: -5,
                              top: -5,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedAssets.remove(asset);
                                  });
                                },
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: Color(0xff5F6368).withOpacity(0.8),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 2.0,
                ),
                itemCount: widget.assets.length,
                itemBuilder: (context, index) {
                  final asset = widget.assets[index];
                  final thumbnailData = widget.thumbnailDataMap[asset];

                  return GestureDetector(
                    onTap: () => _onAssetTapped(asset),
                    child: Stack(
                      children: [
                        Center(
                          child: thumbnailData != null
                              ? Image.memory(thumbnailData,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity)
                              : const CircularProgressIndicator(),
                        ),
                        Positioned(
                          right: 12,
                          top: 8,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Color(0xffFFFFFF).withOpacity(0.4),
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color:
                                        Color(0xff202020).withOpacity(0.12))),
                          ),
                        ),
                        if (selectedAssets.contains(asset))
                          Positioned.fill(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Color(0xff2495EF).withOpacity(0.2),
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
                },
              ),
            ),
          ),
          if (selectedAssets.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff2495EF),
                      foregroundColor: Color(0xffFFFFFF),
                      textStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context, selectedAssets),
                    child: Text('${selectedAssets.length}개 선택'),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
