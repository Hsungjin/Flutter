import 'package:client/theme.dart';
import 'package:client/view_model/login/login_view_model.dart';
import 'package:client/view_model/my_page/my_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("마이페이지"),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.wabizGray[900]!,
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer(
          builder: (context, ref, child) {
            final myPageState = ref.watch(myPageViewModelProvider);
            final loginState = myPageState.loginState;
            final loginModel = myPageState.loginModel;
            return Column(
              children: [
                Container(
                  height: 470,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Consumer(
                        builder: (context, ref, child) {
                          if (loginState ?? false) {
                            return Row(
                              children: [
                                CircleAvatar(
                                  radius: 24,
                                  backgroundColor: AppColors.bg,
                                ),
                                Gap(8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${loginModel?.email}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Gap(4),
                                      Text(
                                        "${loginModel?.username}님 환영합니다.",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    if (context.mounted) {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Text("로그아웃"),
                                          content: Text("로그아웃하시겠습니까?"),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                context.pop();
                                              },
                                              child: Text("취소"),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                ref
                                                    .read(
                                                      loginViewModelProvider
                                                          .notifier,
                                                    )
                                                    .signOut();
                                                context.pop();
                                              },
                                              child: Text("확인"),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  },
                                  icon: Icon(Icons.logout),
                                ),
                              ],
                            );
                          } else {
                            return Row(
                              children: [
                                CircleAvatar(
                                  radius: 24,
                                  backgroundColor: AppColors.bg,
                                ),
                                Gap(8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        context.push("/sign-in");
                                      },
                                      child: Row(
                                        children: [
                                          Text("로그인하기"),
                                          Icon(Icons.keyboard_arrow_right),
                                        ],
                                      ),
                                    ),
                                    Gap(4),
                                    Text(
                                      "로그인 후 다양한 프로젝트에 참여해보세요.",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }
                        },
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundColor: AppColors.wabizGray[200]!,
                            child: SvgPicture.asset(
                              "assets/icons/featured_seasonal_and_gifts.svg",
                              width: 28,
                              height: 28,
                              colorFilter: ColorFilter.mode(
                                AppColors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          Gap(20),
                          Text(
                            "새로운 도전을\n시작해부세요",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Gap(20),
                          Text(
                            "개인 후원부터 제품, 콘텐츠, 서비스 출시, 성장까지 함께할게요.",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          if (!(loginState ?? false)) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("로그인 필요"),
                                content: Text("로그인 후 프로젝트 만들기를 할 수 있습니다."),
                              ),
                            );
                            return;
                          }
                          context.push("/add");
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "프로젝트 만들기",
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
              ],
            );
          },
        ),
      ),
    );
  }
}
