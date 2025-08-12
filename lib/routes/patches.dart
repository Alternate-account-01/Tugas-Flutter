import 'package:flutter/widgets.dart';
import 'package:flutter_the_second/pages/calculator_page.dart';
import 'package:flutter_the_second/pages/football_edit_page.dart';
import 'package:flutter_the_second/pages/football_page.dart';
import 'package:flutter_the_second/routes/routes.dart';
import 'package:get/route_manager.dart';

class AppPage {
  //list or array
  static final pages = [
   GetPage(name: AppRoutes.calculator, page: () => CalculatorPage()),
   GetPage(name: AppRoutes.footballplayers, page: () => FootballPage()),
   GetPage(name: AppRoutes.editfootballplayers, page: () => FootballEditPage()),
  ];

}
