import 'package:flutter/material.dart';

import 'core/dependance_injection/di.dart';
import 'food_app.dart';

void main() {
  setupDI();
  // debugPrintRebuildDirtyWidgets = true;
  runApp(MyApp());
}
