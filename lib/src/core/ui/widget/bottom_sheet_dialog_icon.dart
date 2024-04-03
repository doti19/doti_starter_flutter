import 'package:flutter/material.dart';
import 'package:doti_starter/src/core/constants/index.dart';
import 'package:doti_starter/src/core/generated/colors.gen.dart';

class BottomSheetDialogIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: UiSize.bottomSheetTopIconWidth,
      height: UiSize.bottomSheetTopIconHeight,
      child: Card(
        shadowColor: ColorName.navigationlight,
        color: ColorName.success, //Center
      ), //Card
    );
  }
}
