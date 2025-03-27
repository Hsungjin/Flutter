import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/error/error_response.dart';

class CommonDialog {
  CommonDialog();

  static Future<bool?> errorDialog(BuildContext context, ErrorResponse error) {
    return showDialog<bool>(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: SizedBox(
            height: 70,
            child: Column(
              children: [
                Text(error.message ?? '오류가 발생했습니다'),
                Text(error.code ?? '오류 코드가 없습니다'),
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(onPressed: () => context.pop(true), child: Text('다시 시도')),
            ElevatedButton(onPressed: () => exit(0), child: Text('종료')),
          ],
        );
      },
    );
  }
}

