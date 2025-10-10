import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:timeago/timeago.dart' as timeago;


class NotificationItemWidget extends StatefulWidget {
  final TtossNotification notification;
  final VoidCallback onTap;

  const NotificationItemWidget({super.key, required this.notification, required this.onTap});

  @override
  State<NotificationItemWidget> createState() => _NotificationItemWidgetState();
}

class _NotificationItemWidgetState extends State<NotificationItemWidget> {
  static const double leftPadding = 10;
  static const iconWidth = 25.0;

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: leftPadding),
        color: widget.notification.isRead? context.backgroundColor: const Color.fromARGB(255, 48, 48, 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                width10,
                Image.asset(widget.notification.type.iconPath, width: iconWidth,),
                widget.notification.type.name.text.size(12).color(AppColors.grey).make(),
                EmptyExpanded(),
                timeago.format(widget.notification.time, locale: context.locale.languageCode).text.color(AppColors.grey).make(),
                width10,
              ],
            ),
            widget.notification.description.text.make().pOnly(left: iconWidth + leftPadding),
          ],
        ),
      ),
    );
  }
}
