import 'package:client/model/project/reward_model.dart';
import 'package:client/theme.dart';
import 'package:client/view_model/project/project_view_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class AddRewardPage extends StatefulWidget {
  final String projectId;

  const AddRewardPage({super.key, required this.projectId});

  @override
  State<AddRewardPage> createState() => _AddRewardPageState();
}

class _AddRewardPageState extends State<AddRewardPage> {
  TextEditingController priceTextEditingController = TextEditingController();
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController descriptionTextEditingController =
      TextEditingController();

  @override
  void dispose() {
    priceTextEditingController.dispose();
    titleTextEditingController.dispose();
    descriptionTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('리워드 설계'), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '리워드 추가',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Gap(12),
                DottedBorder(
                  options: RoundedRectDottedBorderOptions(
                    color: AppColors.wabizGray[200]!,
                    radius: Radius.circular(10),
                    dashPattern: [5, 5],
                  ),
                  child: Container(
                    height: 216,
                    width: double.infinity,
                    color: Color(0xfffbfbfb),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle,
                          size: 40,
                          color: AppColors.wabizGray[400],
                        ),
                        Gap(12),
                        Text(
                          '리워드를 추가해주세요.',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.wabizGray[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(24),
                Text(
                  '금액',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Gap(12),
                TextFormField(
                  controller: priceTextEditingController,
                  decoration: InputDecoration(hintText: '0'),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),

                Gap(24),
                Text(
                  '리워드 명',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Gap(12),
                TextFormField(
                  controller: descriptionTextEditingController,
                  decoration: InputDecoration(
                    hintText: '얘시) [얼리버드]베이지 이불+베개 1세트',
                  ),
                  keyboardType: TextInputType.text,
                  maxLength: 60,
                ),

                Gap(24),
                Text(
                  '리워드 설명',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Gap(12),
                Text(
                  '리워드 구성과 혜택을 간결하게 설명해 주세요.',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.wabizGray[400],
                  ),
                ),
                Gap(12),
                TextFormField(
                  controller: descriptionTextEditingController,
                  decoration: InputDecoration(hintText: '리워드 설명을 입력해주세요.'),
                  keyboardType: TextInputType.text,
                  maxLength: 400,
                  maxLines: 10,
                ),

                Gap(24),
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: Text('취소'),
                        ),
                      ),
                      Gap(12),
                      Expanded(
                        child: Consumer(
                          builder: (context, ref, child) {
                            return GestureDetector(
                              onTap: () async {
                                final result = await ref
                                    .watch(projectViewModelProvider.notifier)
                                    .createProjectReward(
                                      widget.projectId,
                                      RewardItemModel(
                                        title: titleTextEditingController.text
                                            .trim(),
                                        price: int.tryParse(
                                          priceTextEditingController.text
                                              .trim(),
                                        ),
                                        description:
                                            descriptionTextEditingController
                                                .text
                                                .trim(),
                                        imageRaw: [],
                                        imageUrl: "",
                                      ),
                                    );

                                if (result) {
                                  if (context.mounted) {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        content: Text("리워드 추가 성공"),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              context.go("/my");
                                            },
                                            child: Text("확인"),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                } else {
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("리워드 추가 실패")),
                                    );
                                  }
                                }
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    '추가',
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
