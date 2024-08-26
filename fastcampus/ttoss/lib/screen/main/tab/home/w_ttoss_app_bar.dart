import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class TtossAppBar extends StatefulWidget {
  const TtossAppBar({super.key});

  @override
  State<TtossAppBar> createState() => _TtossAppBarState();
}

class _TtossAppBarState extends State<TtossAppBar> {
  bool _showRedDot = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: CustomTheme.dark.appColors.appBarBackground,
      child: Row(
        children: [
          width10,
          Image.asset("$basePath/icon/toss.png", height: 30,),
          emptyExpanded,
          Image.asset("$basePath/icon/map_point.png", height: 30,),
          width10,
          Tap(
            onTap: () {
              setState(() {
                _showRedDot = !_showRedDot;
              });
            },
            child: Stack(children: [
              Image.asset("$basePath/icon/notification.png", height: 30,),
              if(_showRedDot)
                Positioned.fill(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration:
                        BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                      ),
                    )) else
                Positioned.fill(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration:
                        BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                      ),
                    ))
              ],
            ),
          ),
          width10
          ,
        ]
        ,
      )
      ,
    );
  }
}
