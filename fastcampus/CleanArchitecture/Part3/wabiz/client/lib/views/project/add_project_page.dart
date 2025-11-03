import 'package:client/model/project/project_model.dart';
import 'package:client/shared/enum/enum_project_class.dart';
import 'package:client/shared/model/project_type.dart';
import 'package:client/theme.dart';
import 'package:client/view_model/login/login_view_model.dart';
import 'package:client/view_model/project/project_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddProjectPage extends StatefulWidget {
  const AddProjectPage({super.key});

  @override
  State<AddProjectPage> createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<AddProjectPage> {
  EnumProjectClass enumProjectClass = EnumProjectClass.funding;

  TextEditingController priceTextEditingController = TextEditingController();
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController makerTextEditingController = TextEditingController();
  TextEditingController deadlineTextEditingController = TextEditingController();
  TextEditingController descriptionTextEditingController =
      TextEditingController();

  ProjectType? projectType;
  XFile? image;

  @override
  void dispose() {
    priceTextEditingController.dispose();
    titleTextEditingController.dispose();
    makerTextEditingController.dispose();
    deadlineTextEditingController.dispose();
    descriptionTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('프로젝트 정보'), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '카테고리',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Gap(12),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.white,
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height - 240,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "카테고리",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () => context.pop(),
                                      icon: Icon(Icons.clear),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Consumer(
                                  builder: (context, ref, child) {
                                    final types = ref.watch(
                                      fetchProjectTypesProvider,
                                    );
                                    return switch (types) {
                                      AsyncData(:final value) =>
                                        ListView.separated(
                                          itemCount: value.length,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              leading: SvgPicture.asset(
                                                value[index].imagePath ?? '',
                                              ),
                                              title: Text(
                                                value[index].type ?? '',
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  projectType = value[index];
                                                });
                                                context.pop();
                                              },
                                            );
                                          },
                                          separatorBuilder: (context, index) {
                                            return Divider(
                                              height: 1,
                                              color: AppColors.wabizGray[200]!,
                                            );
                                          },
                                        ),
                                      AsyncError(:final error) => Text(
                                        error.toString(),
                                      ),
                                      AsyncLoading() => Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    };
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.wabizGray[200]!),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${projectType != null ? projectType?.type : '카테고리 선택'}",
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.keyboard_arrow_down),
                        ),
                      ],
                    ),
                  ),
                ),
                // 프로젝트 유형
                Gap(24),
                Text(
                  '프로젝트 유형',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Gap(12),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.wabizGray[200]!),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: RadioGroup(
                    onChanged: (value) => setState(
                      () =>
                          enumProjectClass = value ?? EnumProjectClass.funding,
                    ),
                    groupValue: enumProjectClass,
                    child: Column(
                      children: [
                        RadioListTile(
                          value: EnumProjectClass.funding,
                          title: Text('${EnumProjectClass.funding.title}'),
                          subtitle: Text(
                            '${EnumProjectClass.funding.subtitle}',
                          ),
                        ),
                        RadioListTile(
                          value: EnumProjectClass.preOrder,
                          title: Text('${EnumProjectClass.preOrder.title}'),
                          subtitle: Text(
                            '${EnumProjectClass.preOrder.subtitle}',
                          ),
                        ),
                        RadioListTile(
                          value: EnumProjectClass.preOrderGlobal,
                          title: Text(
                            '${EnumProjectClass.preOrderGlobal.title}',
                          ),
                          subtitle: Text(
                            '${EnumProjectClass.preOrderGlobal.subtitle}',
                          ),
                        ),
                        RadioListTile(
                          value: EnumProjectClass.preOrderEncore,
                          title: Text(
                            '${EnumProjectClass.preOrderEncore.title}',
                          ),
                          subtitle: Text(
                            '${EnumProjectClass.preOrderEncore.subtitle}',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // 목표금액
                Gap(24),
                Text(
                  '목표 금액',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Gap(12),
                Text("최소 50만원 ~ 최대 1억원 사이에서 설정해주세요."),
                Gap(12),
                TextFormField(
                  controller: priceTextEditingController,
                  decoration: InputDecoration(
                    hintText: '목표 금액을 입력해주세요.',
                    suffix: Text('원'),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                // 프로젝트 제목
                Gap(24),
                Text(
                  '프로젝트 제목',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Gap(12),
                TextFormField(
                  controller: titleTextEditingController,
                  decoration: InputDecoration(hintText: '제목을 입력해주세요.'),
                  keyboardType: TextInputType.text,
                  maxLength: 40,
                ),
                // 프로젝트 메이커
                Gap(24),
                Text(
                  '프로젝트 메이커',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Gap(12),
                TextFormField(
                  controller: makerTextEditingController,
                  decoration: InputDecoration(hintText: '메이커명을 입력해주세요.'),
                  keyboardType: TextInputType.text,
                ),

                // 대표 이미지
                Gap(24),
                Text(
                  '대표 이미지',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Gap(12),
                Text(
                  "메인, 검색 결과, SNS 광고 등 여러 곳에서 노출할 대표 이미지를 등록해 주세요.",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.wabizGray[400],
                  ),
                ),
                Gap(12),
                InkWell(
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    image = await picker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      image = image;
                    });
                  },
                  child: Container(
                    height: 70,
                    width: 86,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.wabizGray[200]!),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt,
                          size: 24,
                          color: AppColors.wabizGray[400],
                        ),
                        Text(
                          image == null ? "0/1" : "1/1",
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

                // 프로젝트 종료일
                Gap(24),
                Text(
                  '프로젝트 종료일',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Gap(12),
                TextFormField(
                  controller: deadlineTextEditingController,
                  decoration: InputDecoration(
                    hintText: '예시) 2025-12-31',
                    suffixIcon: IconButton(
                      onPressed: () async {
                        final DateTime? date = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2025, 12, 31),
                        );

                        deadlineTextEditingController.text = DateFormat(
                          'yyyy-MM-dd',
                        ).format(date ?? DateTime.now());
                      },
                      icon: Icon(Icons.calendar_month),
                    ),
                  ),
                ),
                // 프로젝트 요약
                Gap(24),
                Text(
                  '프로젝트 요약',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Gap(12),
                Text(
                  "소개 영상이나 사진과 함께 보이는 글이에요. 프로젝트를 쉽고 간결하게 소개해주세요.",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.wabizGray[400],
                  ),
                ),
                Gap(12),
                TextFormField(
                  controller: descriptionTextEditingController,
                  decoration: InputDecoration(hintText: '내용 입력'),
                  keyboardType: TextInputType.text,
                  maxLines: 4,
                  maxLength: 100,
                ),

                // 저장하기 버튼
                Gap(24),
                Consumer(
                  builder: (context, ref, child) {
                    return MaterialButton(
                      onPressed: () async {
                        final _image = await image?.readAsBytes();
                        final response = await ref
                            .watch(projectViewModelProvider.notifier)
                            .createProject(
                              ProjectItemModel(
                                categoryId: 1,
                                projectTypeId: projectType?.id,
                                title: titleTextEditingController.text.trim(),
                                owner: makerTextEditingController.text.trim(),
                                deadline: deadlineTextEditingController.text
                                    .trim(),
                                description: descriptionTextEditingController
                                    .text
                                    .trim(),
                                price: int.tryParse(
                                  priceTextEditingController.text.trim(),
                                ),
                                projectClass: enumProjectClass.title,
                                userId: ref
                                    .read(loginViewModelProvider)
                                    .userid
                                    .toString(),
                                projectImage: _image ?? [],
                              ),
                            );

                        if (response) {
                          if (context.mounted) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("안내"),
                                content: Text("프로젝트 정보 등록 성공"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      context.go("/my");
                                    },
                                    child: Text("마이페이지로 돌아가기"),
                                  ),
                                ],
                              ),
                            );
                          }
                        } else {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("프로젝트 정보 등록 실패")),
                            );
                          }
                        }
                      },
                      height: 50,
                      minWidth: double.infinity,
                      elevation: 0,
                      color: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '저장하기',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
