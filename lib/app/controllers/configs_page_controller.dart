import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/core/constants/app_routes_names.dart';

class ConfigsPageController extends GetxController {
  //
  List<ConfigModel> configs = [];

  final List<ConfigModel> _confData = [
    ConfigModel(
      key: 'subjects',
      index: 1,
      desc: 'subjects_hint',
      icon: Icons.book_outlined,
      onPressed: () {
//
        Get.toNamed(AppRoutes.subjectsPage);
      },
    ),
    ConfigModel(
      key: 'grades',
      index: 2,
      desc: "grades_hint",
      icon: Icons.business,
      onPressed: () {
        //
        Get.toNamed(AppRoutes.gradesPage);
      },
    ),
    ConfigModel(
      key: 'year',
      index: 3,
      desc: "year_hint",
      icon: Icons.document_scanner,
      onPressed: () {
        //
      },
    ),
    ConfigModel(
      key: 'semesters',
      index: 5,
      desc: "semesters_hint",
      icon: Icons.corporate_fare,
      onPressed: () {
        //
      },
    )
  ];

  @override
  void onInit() {
    configs = _confData;
    super.onInit();
  }

  void onPressConfigCard(int index) {
    var fun = configs[index].onPressed;
    if (fun != null) {
      fun();
    }
  }
}

class ConfigModel {
  final String key;
  final int index;
  final String desc;
  final IconData icon;
  final bool isAuthrized;
  final Function()? onPressed;

  ConfigModel({
    required this.key,
    required this.index,
    required this.desc,
    required this.icon,
    required this.onPressed,
    this.isAuthrized = true,
  });
}
