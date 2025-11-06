import 'package:client/domain/entitiy/shared/category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_home_categories.g.dart';

@riverpod
Future<List<ProjectCategory>> fetchHomeCategories(Ref ref) async {
  await Future.delayed(const Duration(seconds: 1));
  List<ProjectCategory> categories = [
    ProjectCategory(
      id: 1,
      category: 'Category 1',
      title: '펀딩 +',
      iconPath: 'assets/icons/categories/1.png',
      created: '2021-01-01',
    ),
    ProjectCategory(
      id: 2,
      category: 'Category 2',
      title: '오픈예정',
      iconPath: 'assets/icons/categories/2.png',
      created: '2021-01-02',
    ),
    ProjectCategory(
      id: 3,
      category: 'Category 3',
      title: '스토어',
      iconPath: 'assets/icons/categories/3.png',
      created: '2021-01-03',
    ),
    ProjectCategory(
      id: 4,
      category: 'Category 4',
      title: '예약구매',
      iconPath: 'assets/icons/categories/4.png',
      created: '2021-01-04',
    ),
    ProjectCategory(
      id: 5,
      category: 'Category 5',
      title: '취소',
      iconPath: 'assets/icons/categories/5.png',
      created: '2021-01-05',
    ),
    ProjectCategory(
      id: 6,
      category: 'Category 5',
      title: '펀딩체험단',
      iconPath: 'assets/icons/categories/6.png',
      created: '2021-01-05',
    ),
    ProjectCategory(
      id: 7,
      category: 'Category 5',
      title: '뷰티워크',
      iconPath: 'assets/icons/categories/7.png',
      created: '2021-01-05',
    ),
    ProjectCategory(
      id: 8,
      category: 'Category 5',
      title: '새학기출발',
      iconPath: 'assets/icons/categories/8.png',
      created: '2021-01-05',
    ),
    ProjectCategory(
      id: 9,
      category: 'Category 5',
      title: '개발자 모집',
      iconPath: 'assets/icons/categories/9.png',
      created: '2021-01-05',
    ),
  ];

  return categories;
}
