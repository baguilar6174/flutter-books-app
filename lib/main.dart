import 'package:flutter/material.dart';
import './app/dependency_injection/injection_container.dart' as di;
import 'app/my_app.dart';

void main() async {
  await di.init();
  runApp(const MyApp());
}