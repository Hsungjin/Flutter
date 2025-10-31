import 'package:client/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

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
          color: AppColors.wabizGary[900]!,
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 470,
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(radius: 24, backgroundColor: AppColors.bg),
                    Gap(8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Text("로그인하기"),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                        Gap(4),
                        Text(
                          "로그인 후 다양한 프로젝트에 참여해보세요.",
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: AppColors.wabizGary[200]!,
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
                    //TODO: 로그인 처리 확인
                    //TODO: 프로젝트 추가 화면으로 이동
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
      ),
    );
  }
}
