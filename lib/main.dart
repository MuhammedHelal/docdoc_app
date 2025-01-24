import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced/core/DI/locator.dart';

import 'docdoc_app.dart';

void main() {
  setupLocator();
  runApp(const DocdocApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
}
