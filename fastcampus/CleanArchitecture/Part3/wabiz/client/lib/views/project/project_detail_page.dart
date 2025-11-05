import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/model/category/category_model.dart';
import 'package:client/model/project/project_model.dart';
import 'package:client/theme.dart';
import 'package:client/view_model/favorite/favorite_view_model.dart';
import 'package:client/view_model/project/project_view_model.dart';
import 'package:client/views/project/detail/project_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ProjectDetailPage extends StatefulWidget {
  final String project;

  const ProjectDetailPage({super.key, required this.project});

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  late ProjectItemModel projectItemModel;
  ValueNotifier<bool> isMore = ValueNotifier(false);

  @override
  initState() {
    super.initState();
    projectItemModel = ProjectItemModel.fromJson(jsonDecode(widget.project));
  }

  @override
  void dispose() {
    isMore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.go("/home");
            },
            icon: SvgPicture.asset(
              "assets/icons/home_outlined.svg",
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final project = ref.watch(
            projectDetailViewModelProvider(projectItemModel.id.toString()),
          );
          // final project = ref.watch(
          //   fetchProjectProvider(projectItemModel.id.toString()),
          // );

          return project.when(
            data: (data) {
              return Column(
                children: [
                  Container(
                    height: 240,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          projectItemModel.thumbnail ?? "",
                        ),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withValues(alpha: 0.2),
                          BlendMode.darken,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ValueListenableBuilder(
                      valueListenable: isMore,
                      builder: (context, value, child) {
                        return Stack(
                          children: [
                            Positioned.fill(
                              child: SingleChildScrollView(
                                physics: !value
                                    ? NeverScrollableScrollPhysics()
                                    : BouncingScrollPhysics(),
                                child: ProjectDetailWidget(data: data),
                              ),
                            ),
                            if (!value)
                              Positioned(
                                left: 16,
                                right: 16,
                                bottom: 0,
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.white,
                                        Colors.white,
                                        Colors.white,
                                        Colors.white,
                                        Colors.white.withValues(alpha: 0.1),
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                ),
                              ),
                            if (!value)
                              Positioned(
                                left: 16,
                                right: 16,
                                bottom: 16,
                                child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      border: Border.all(
                                        color: AppColors.primary,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "스토리 더보기",
                                          style: TextStyle(
                                            color: AppColors.primary,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Gap(12),
                                        Icon(
                                          Icons.keyboard_arrow_down,
                                          size: 16,
                                          color: AppColors.primary,
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      isMore.value = true;
                                    });
                                  },
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              );
            },
            error: (error, stack) {
              return Center(child: Text(error.toString()));
            },
            loading: () {
              return Center(child: CircularProgressIndicator());
            },
          );
        },
      ),
      bottomNavigationBar: _BottomAppBar(projectItemModel: projectItemModel),
    );
  }
}

class _BottomAppBar extends ConsumerWidget {
  final ProjectItemModel projectItemModel;

  const _BottomAppBar({super.key, required this.projectItemModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteViewModelProvider);
    final current = favorites.projects
        .where((element) => element.id == projectItemModel.id)
        .toList();

    return BottomAppBar(
      height: 84,
      color: AppColors.white,
      surfaceTintColor: AppColors.white,
      padding: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.newBg)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    if (current.isNotEmpty) {
                      ref
                          .read(favoriteViewModelProvider.notifier)
                          .removeItem(
                            CategoryItemModel(id: projectItemModel.id),
                          );
                    } else {
                      ref
                          .read(favoriteViewModelProvider.notifier)
                          .addItem(
                            CategoryItemModel(
                              id: projectItemModel.id,
                              thumbnail: projectItemModel.thumbnail,
                              description: projectItemModel.description,
                              title: projectItemModel.title,
                              owner: projectItemModel.owner,
                              totalFunded: projectItemModel.totalFunded,
                              waitlistCount: projectItemModel.waitlistCount,
                              totalFundedCount:
                                  projectItemModel.totalFundedCount,
                            ),
                          );
                    }
                  },
                  icon: Icon(
                    current.isNotEmpty ? Icons.favorite : Icons.favorite_border,
                    size: 24,
                    color: current.isNotEmpty ? Colors.red : AppColors.primary,
                  ),
                ),
                Text("1만+"),
              ],
            ),
            Gap(24),
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "펀딩하기",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
