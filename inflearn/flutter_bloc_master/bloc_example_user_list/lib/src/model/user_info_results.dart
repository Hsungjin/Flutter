import 'package:equatable/equatable.dart';

class UserInfoResults extends Equatable {
  final int currentPage;
  final List<UserInfo> userInfoList;

  const UserInfoResults({
    required this.currentPage,
    required this.userInfoList,
  });

  factory UserInfoResults.fromJson(Map<String, dynamic> json) {
    return UserInfoResults(
      currentPage: (json['info']['page'] as int) + 1,
      userInfoList:
          json['results']
              .map<UserInfo>((item) => UserInfo.fromJson(item))
              .toList(),
    );
  }

  UserInfoResults copyWithFromJson(Map<String, dynamic> json) {
    return UserInfoResults(
      currentPage: (json['info']['page'] as int) + 1,
      userInfoList:
          userInfoList..addAll(
            json['results']
                .map<UserInfo>((item) => UserInfo.fromJson(item))
                .toList(),
          ),
    );
  }

  @override
  List<Object?> get props => [currentPage, userInfoList];
}

class UserInfo extends Equatable {
  final String profileImage;
  final String name;
  final String email;
  final String phone;

  const UserInfo({
    required this.profileImage,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      profileImage: json['picture']['medium'],
      name: json['name']['first'] + json['name']['last'],
      email: json['email'],
      phone: json['phone'],
    );
  }

  @override
  List<Object?> get props => [profileImage, name, email, phone];
}
