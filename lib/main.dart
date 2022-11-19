import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:state_management/shared/util/app_dependencies.dart';
import 'package:state_management/state_management.dart';

void main() async {
  await firstSetup();

  runApp(const MyApp());
}

Future<void> firstSetup() async {
  await dotenv.load(fileName: '.env');

  AppDependencies().setup();
}
