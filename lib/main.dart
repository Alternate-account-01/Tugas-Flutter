import 'package:flutter/material.dart';
import 'package:flutter_the_second/routes/patches.dart';
import 'package:flutter_the_second/routes/routes.dart';
import 'package:get/get.dart';
import 'package:flutter_the_second/pages/calculator_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.login,
      getPages: AppPage.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
