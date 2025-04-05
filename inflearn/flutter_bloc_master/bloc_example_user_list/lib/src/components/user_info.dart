import 'package:bloc_example_user_list/src/model/user_info_results.dart';
import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key, required this.userInfo});

  final UserInfo userInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(userInfo.profileImage),
            radius: 35,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  userInfo.email,
                  style: TextStyle(fontWeight: FontWeight.w200, fontSize: 11),
                ),
                Text(
                  userInfo.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    Icon(Icons.phone, size: 20),
                    Text(
                      userInfo.phone,
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
