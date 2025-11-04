import 'package:client/model/project/project_model.dart';
import 'package:client/theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class ProjectDetailWidget extends StatelessWidget {
  final ProjectItemModel data;
  const ProjectDetailWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    data.type ?? "",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.wabizGray[500]!,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gap(4),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 16,
                    color: AppColors.wabizGray[500]!,
                  ),
                ],
              ),
              Gap(12),
              Text(
                data.title ?? "",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              Gap(12),
              Row(
                children: [
                  Text(
                    "${NumberFormat("###,###,###").format(((data.totalFunded ?? 0).toDouble() / (data.price ?? 0).toDouble()) * 100)} % 달성",
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Divider(color: AppColors.newBg, height: 32),

                  Gap(12),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    child: Text(
                      "${(DateTime.parse(data.deadline ?? "").difference(DateTime.now()).inDays)}일 남음",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(12),
              Row(
                children: [
                  Text(
                    "${NumberFormat.currency(locale: "ko_KR", symbol: "").format(data.totalFunded ?? 0)}원 달성",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Gap(12),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.bg,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    child: Text(
                      "${NumberFormat("###,###,###").format(data.totalFundedCount ?? 0)}명 참여",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "프로젝트 스토리",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              Gap(12),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.newBg,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Text(
                  "도서산간에 해당하는 서포터님은 배송 가능 여부를 반드시 메이커에게 문의 후 참여해 주세요.",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              Gap(12),
              Image.asset(
                "assets/image/advertising_image.png",
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        ),
      ],
    );
  }
}