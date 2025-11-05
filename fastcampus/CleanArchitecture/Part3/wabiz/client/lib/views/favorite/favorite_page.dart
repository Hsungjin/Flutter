import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/theme.dart';
import 'package:client/view_model/favorite/favorite_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<String> tabs = ["펀딩", "메이커", "알림신청", "펀딩/프리오더", "스토어"];

  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "관심 있는 소식만 모았어요",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                ],
              ),
            ),
            Container(
              height: 32,
              padding: EdgeInsets.only(left: 16),
              child: ListView.builder(
                itemCount: tabs.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 12),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                      color: selectedTab == index
                          ? AppColors.wabizGray[200]!
                          : Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        tabs[index],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: selectedTab == index
                              ? AppColors.wabizGray[900]!
                              : AppColors.wabizGray[400]!,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Gap(12),
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  final favorites = ref.watch(favoriteViewModelProvider);

                  if (favorites.projects.isEmpty) {
                    return Center(child: Text("관심 있는 소식이 없습니다."));
                  }

                  return ListView.builder(
                    itemCount: favorites.projects.length,
                    itemBuilder: (context, index) {
                      final project = favorites.projects[index];
                      return Container(
                        margin: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 20,
                          bottom: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 30,
                              spreadRadius: 4,
                              offset: Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 190,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    project.thumbnail ?? "",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: IconButton(
                                      onPressed: () {
                                        ref
                                            .read(
                                              favoriteViewModelProvider
                                                  .notifier,
                                            )
                                            .removeItem(project);
                                      },
                                      icon: Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${NumberFormat("###,###,###").format(project.waitlistCount ?? 0)} 명이 기다려요",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  Gap(8),
                                  Text(project.title ?? ""),
                                  Gap(24),
                                  Text(
                                    project.owner ?? "",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.wabizGray[500],
                                    ),
                                  ),
                                  Gap(12),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.bg,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: Text(
                                      project.isOpen == "close" ? "오픈예정" : "오픈",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.wabizGray[400],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
