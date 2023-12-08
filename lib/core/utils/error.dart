import 'package:assignment_test/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';

Widget buildError(var size, {String? text}) {
  return Column(
    children: [
      SizedBox(
        height: size.height / 5,
      ),
      Center(
        child: Column(
          children: [
            const Icon(
              Icons.cancel_outlined,
              color: Colors.red,
              size: 75,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomText(
              text: text ?? 'error',
              fontSize: 25,
            )
          ],
        ),
      ),
    ],
  );
}
