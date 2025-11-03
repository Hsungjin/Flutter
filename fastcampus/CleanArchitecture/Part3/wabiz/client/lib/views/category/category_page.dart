import 'dart:math';

import 'package:client/theme.dart';
import 'package:client/view_model/category/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class CategoryPage extends ConsumerStatefulWidget {
  final String categoryId;

  const CategoryPage({super.key, required this.categoryId});

  @override
  ConsumerState<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends ConsumerState<CategoryPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(categoryViewModelProvider.notifier)
          .fetchProjects(widget.categoryId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("카테고리"),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/home_outlined.svg",
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // 최상위 프로젝트
          SizedBox(
            height: 204,
            child: Consumer(
              builder: (context, ref, child) {
                final datas = ref.watch(
                  fetchCategoryProjectsProvider(widget.categoryId),
                );
                return datas.when(
                  data: (data) {
                    final titleProject = data
                        .projects[Random().nextInt(data.projects.length - 1)];
                    return Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey[800]!,
                        image: DecorationImage(
                          image: NetworkImage(titleProject.thumbnail ?? ""),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withValues(alpha: 0.5),
                            BlendMode.darken,
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            titleProject.title ?? "",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          Text(
                            titleProject.description ?? "",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Gap(16),
                          Container(
                            height: 4,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  error: (error, stackTrace) {
                    return Center(child: Text("${error.toString()}"));
                  },
                  loading: () {
                    return Center(child: CircularProgressIndicator());
                  },
                );
                // return Container(
                //   width: double.infinity,
                //   padding: EdgeInsets.all(20),
                //   decoration: BoxDecoration(color: Colors.grey[800]!),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         "최고의 이어폰ㅣ전문가가 만든 완벽한 이어폰",
                //         style: TextStyle(
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold,
                //           color: Colors.white,
                //           overflow: TextOverflow.ellipsis,
                //         ),
                //         maxLines: 1,
                //       ),
                //       Gap(12),
                //       Text(
                //         "전문가가 만든 이어폰 하나 둘 셋 넷 다섯,",
                //         style: TextStyle(
                //           color: Colors.white,
                //           overflow: TextOverflow.ellipsis,
                //         ),
                //         maxLines: 1,
                //       ),
                //       Gap(16),
                //       Container(
                //         height: 4,
                //         width: 120,
                //         decoration: BoxDecoration(
                //           color: Colors.white,
                //           borderRadius: BorderRadius.circular(2),
                //         ),
                //       ),
                //     ],
                //   ),
                // );
              },
            ),
          ),
          // 탭
          Container(
            height: 110,
            decoration: BoxDecoration(color: Colors.white),
            padding: EdgeInsets.fromLTRB(8, 16, 8, 0),
            child: Consumer(
              builder: (context, ref, child) {
                final types = ref.watch(fetchTypeTabsProvider);
                return types.when(
                  data: (data) {
                    return Consumer(
                      builder: (context, ref, child) {
                        final vm = ref.watch(categoryViewModelProvider);
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final tab = data[index];
                            return GestureDetector(
                              onTap: () {
                                ref
                                    .read(categoryViewModelProvider.notifier)
                                    .updateType(tab);

                                ref
                                    .read(categoryViewModelProvider.notifier)
                                    .fetchProjects(widget.categoryId);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: index == 0 ? 0 : 32,
                                ),
                                child: IntrinsicWidth(
                                  child: Column(
                                    children: [
                                      Gap(8),
                                      SvgPicture.asset(
                                        tab.imagePath ?? "",
                                        width: 32,
                                        height: 32,
                                      ),
                                      Gap(12),
                                      Text(
                                        tab.type ?? "",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight:
                                              vm.selectedType?.id == tab.id
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                        ),
                                      ),
                                      Gap(12),
                                      Container(
                                        height: 6,
                                        color: vm.selectedType?.id == tab.id
                                            ? Colors.black
                                            : Colors.transparent,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  error: (error, stackTrace) {
                    return Center(child: Text("${error.toString()}"));
                  },
                  loading: () {
                    return Center(child: CircularProgressIndicator());
                  },
                );
                // return ListView.builder(
                //   scrollDirection: Axis.horizontal,
                //   itemCount: 10,
                //   itemBuilder: (context, index) {
                //     return Padding(
                //       padding: EdgeInsets.only(left: index == 0 ? 0 : 32),
                //       child: IntrinsicWidth(
                //         child: Column(
                //           children: [
                //             Gap(8),
                //             CircleAvatar(radius: 16),
                //             Gap(12),
                //             Text("테크"),
                //             Gap(12),
                //             Container(height: 6, color: Colors.black),
                //           ],
                //         ),
                //       ),
                //     );
                //   },
                // );
              },
            ),
          ),
          Divider(height: 0),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Consumer(
                builder: (context, ref, child) {
                  final projects = ref.watch(
                    fectchCategoryProjectsByTypeProvider(widget.categoryId),
                  );
                  return projects.when(
                    data: (data) {
                      if (data.projects.isEmpty) {
                        return Center(child: Text("프로젝트가 없습니다."));
                      }
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              children: [
                                DropdownButton(
                                  value: "all",
                                  items: [
                                    DropdownMenuItem(
                                      value: "all",
                                      child: Text("전체"),
                                    ),
                                  ],
                                  onChanged: (value) {},
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  underline: SizedBox.shrink(),
                                ),
                                Gap(24),
                                Consumer(
                                  builder: (context, ref, child) {
                                    final filter = ref
                                        .watch(categoryViewModelProvider)
                                        .projectFilter;
                                    return DropdownButton(
                                      value: filter?.name,
                                      items: [
                                        ...EnumCategoryProjectType.values.map(
                                          (e) => DropdownMenuItem(
                                            value: e.name,
                                            child: Text(e.value),
                                          ),
                                        ),
                                        DropdownMenuItem(
                                          value: EnumCategoryProjectType
                                              .recommend
                                              .name,
                                          child: Text(
                                            EnumCategoryProjectType
                                                .recommend
                                                .value,
                                          ),
                                        ),
                                      ],
                                      onChanged: (value) {
                                        ref
                                            .read(
                                              categoryViewModelProvider
                                                  .notifier,
                                            )
                                            .updateProjectFilter(
                                              EnumCategoryProjectType.values
                                                  .firstWhere(
                                                    (e) => e.name == value,
                                                  ),
                                            );
                                      },
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      underline: SizedBox.shrink(),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: data.projects.length,
                              itemBuilder: (context, index) {
                                final project = data.projects[index];
                                return InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 24),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 180,
                                          height: 120,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                project.thumbnail ?? "",
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                top: 2,
                                                right: 2,
                                                child: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.favorite_border,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Gap(16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                project.title ?? "",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Gap(8),
                                              Text(
                                                project.owner ?? "",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color:
                                                      AppColors.wabizGray[500]!,
                                                ),
                                              ),
                                              Gap(8),
                                              Text(
                                                "${NumberFormat("###,###,###,###").format(project.totalFundedCount)} 명 참여",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                              Gap(8),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 6,
                                                  vertical: 4,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: AppColors.bg,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: Text(
                                                  switch (project.totalFunded ??
                                                      0) {
                                                    >= 10000000 && 1000000 =>
                                                      "${NumberFormat("###,###,###,###").format(project.totalFunded ?? 0 ~/ 10000000)}원",
                                                    >= 1000000 && < 100000 =>
                                                      "${NumberFormat("###,###,###,###").format(project.totalFunded ?? 0 ~/ 1000000)}원",
                                                    _ =>
                                                      "${NumberFormat("###,###,###,###").format(project.totalFunded ?? 0)}원",
                                                  },
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                    error: (error, stackTrace) {
                      return Center(child: Text("${error.toString()}"));
                    },
                    loading: () {
                      return Center(child: CircularProgressIndicator());
                    },
                  );
                },
                // return Column(
                //   children: [
                //     Padding(
                //       padding: EdgeInsets.symmetric(vertical: 12),
                //       child: Row(
                //         children: [
                //           DropdownButton(
                //             items: [
                //               DropdownMenuItem(value: "all", child: Text("전체")),
                //             ],
                //             onChanged: (value) {},
                //             icon: Icon(Icons.keyboard_arrow_down),
                //             underline: SizedBox.shrink(),
                //           ),
                //           Gap(24),
                //           DropdownButton(
                //             items: [
                //               DropdownMenuItem(
                //                 value: "recommend",
                //                 child: Text("추천순"),
                //               ),
                //             ],
                //             onChanged: (value) {},
                //             icon: Icon(Icons.keyboard_arrow_down),
                //             underline: SizedBox.shrink(),
                //           ),
                //         ],
                //       ),
                //     ),
                //     Expanded(
                //       child: ListView.builder(
                //         itemCount: 10,
                //         itemBuilder: (context, index) {
                //           return InkWell(
                //             onTap: () {},
                //             child: Padding(
                //               padding: EdgeInsets.only(bottom: 24),
                //               child: Row(
                //                 children: [
                //                   Container(
                //                     width: 180,
                //                     height: 120,
                //                     decoration: BoxDecoration(
                //                       color: Colors.blue,
                //                       borderRadius: BorderRadius.circular(10),
                //                     ),
                //                     child: Stack(
                //                       children: [
                //                         Positioned(
                //                           top: 2,
                //                           right: 2,
                //                           child: IconButton(
                //                             onPressed: () {},
                //                             icon: Icon(Icons.favorite_border),
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                   ),
                //                   Gap(16),
                //                   Expanded(
                //                     child: Column(
                //                       crossAxisAlignment:
                //                           CrossAxisAlignment.start,
                //                       children: [
                //                         Text(
                //                           "[내 손안의 와이파이] 6G 라우터로 어디서든 빠르게",
                //                           maxLines: 2,
                //                           overflow: TextOverflow.ellipsis,
                //                         ),
                //                         Gap(8),
                //                         Text(
                //                           "홍길동",
                //                           style: TextStyle(
                //                             fontSize: 12,
                //                             color: AppColors.wabizGary[500]!,
                //                           ),
                //                         ),
                //                         Gap(8),
                //                         Text(
                //                           "1,000 명 참여",
                //                           style: TextStyle(
                //                             fontWeight: FontWeight.w600,
                //                             color: AppColors.primary,
                //                           ),
                //                         ),
                //                         Gap(8),
                //                         Container(
                //                           padding: EdgeInsets.symmetric(
                //                             horizontal: 6,
                //                             vertical: 4,
                //                           ),
                //                           decoration: BoxDecoration(
                //                             color: AppColors.bg,
                //                             borderRadius: BorderRadius.circular(
                //                               4,
                //                             ),
                //                           ),
                //                           child: Text(
                //                             "1,000원",
                //                             style: TextStyle(
                //                               fontSize: 12,
                //                               fontWeight: FontWeight.w500,
                //                             ),
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           );
                //         },
                //       ),
                //     ),
                //   ],
                // );
              ),
            ),
          ),
        ],
      ),
    );
  }
}
