import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled9/utils/app_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '_lib.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppInfo.appTitle,
      theme: ThemeData(
        textTheme: AppInfo.appTextTheme,
      ),
      home: const HomeScreen(),
    );
  }
}
