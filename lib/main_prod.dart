import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced/core/DI/locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'docdoc_app.dart';

void main() async {
  setupLocator();
  await ScreenUtil.ensureScreenSize();
  runApp(const DocdocApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
}
