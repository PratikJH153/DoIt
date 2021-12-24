import 'package:challengeapp/widgets/constants.dart';
import 'package:flutter/material.dart';

Widget topIntroAuthenticate({
  required BuildContext context,
  required String des1,
  required String des2,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        des1,
        style: kIntroTextStyle,
      ),
      Text(
        des2,
        style: kDesTextStyle,
      ),
    ],
  );
}
