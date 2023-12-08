import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/enums/message_type.dart';
import '../colors.dart';

class CustomToast {
  static showMessage(
      {required String message, MessageType? messageType = MessageType.INFO}) {
    String imageName = 'info';
    Color ShadowColor = AppColors.mainBlueColor;

    switch (messageType) {
      case MessageType.REJECTED:
        imageName = 'rejected-01';
        ShadowColor = AppColors.mainRedColor;
        break;
      case MessageType.SUCCESS:
        imageName = 'approved1-01';
        ShadowColor = AppColors.mainBlueColor;
        break;
      case MessageType.INFO:
        imageName = 'info';
        ShadowColor = AppColors.mainBlueColor;
        break;
      case MessageType.WARNING:
        imageName = 'warning';
        ShadowColor = AppColors.mainPurpleColor;
        break;

      case null:
        break;
    }
    BotToast.showCustomText(
      toastBuilder: (value) {
        const Duration(seconds: 15);
        return Container(
            width: 200,
            decoration: BoxDecoration(
                color: AppColors.mainWhiteColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: ShadowColor.withOpacity(0.5),
                    blurRadius: 7,
                    spreadRadius: 5,
                    offset: const Offset(0, 3),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 30,
                ),
                SvgPicture.asset(
                  'assets/images/$imageName.svg',
                  width: 50,
                  height: 50,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(message),
                const SizedBox(
                  height: 50,
                ),
              ],
            ));
      },
    );
  }
}
