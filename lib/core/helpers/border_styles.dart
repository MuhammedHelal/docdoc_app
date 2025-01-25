import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/consts/app_consts.dart';

abstract class BorderStyles {
  static const greenOutlinedInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(AppConsts.outlinedInputBorderRadius),
    ),
    borderSide: BorderSide(color: Colors.green),
  );
  static const redOutlinedInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(AppConsts.outlinedInputBorderRadius),
    ),
    borderSide: BorderSide(color: Colors.red),
  );
}
