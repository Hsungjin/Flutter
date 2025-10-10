import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:fast_app_base/screen/notification/w_notification_item.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';

class NotificationDiaglog extends DialogWidget {
  final List<TtossNotification> notifications;
  NotificationDiaglog(this.notifications, {super.key, super.animation = NavAni.Bottom});

  @override
  DialogState<NotificationDiaglog> createState() => _NotificationDiaglogState();
}

class _NotificationDiaglogState extends DialogState<NotificationDiaglog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...widget.notifications.map((element) => NotificationItemWidget(notification: element, onTap: () {
            widget.hide();
          }))
        ],
      ),
    );
  }
}
