import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/app/data/model/school_model.dart';
import 'package:school_controll/core/constants/app_routes_names.dart';
import 'package:school_controll/core/services/services.dart';

class ConfigsPageController extends GetxController {
  //
  List<ConfigModel> configs = [];
  SchoolModel school = SchoolModel();
  final List<ConfigModel> _confData = [
    ConfigModel(
      key: 'subjects',
      index: 1,
      desc: 'subjects_hint',
      icon: Icons.book_outlined,
      onPressed: () {
//
        Get.toNamed(AppRoutes.subjectsPage,
            arguments: {"icon": Icons.book_outlined});
      },
    ),
    ConfigModel(
      key: 'grades',
      index: 2,
      desc: "grades_hint",
      icon: Icons.window_outlined,
      onPressed: () {
        //
        Get.toNamed(AppRoutes.gradesPage,
            arguments: {"icon": Icons.window_outlined});
      },
    ),
    ConfigModel(
      key: 'semesters',
      index: 3,
      desc: "semesters_hint",
      icon: Icons.horizontal_split_outlined,
      onPressed: () {
        //
        Get.toNamed(AppRoutes.semstersPage,
            arguments: {"icon": Icons.horizontal_split_outlined});
      },
    ),
    ConfigModel(
      key: 'teachers',
      index: 4,
      desc: "teachers_hint",
      icon: Icons.people_alt_outlined,
      onPressed: () {
        //
        Get.toNamed(AppRoutes.teachersPage,
            arguments: {"icon": Icons.people_alt_outlined});
      },
    ),
    ConfigModel(
      key: 'branches',
      index: 5,
      desc: "branches_hint",
      icon: Icons.business_outlined,
      onPressed: () {
        //
        Get.toNamed(AppRoutes.branchesPage,
            arguments: {"icon": Icons.business_outlined});
      },
    ),
    ConfigModel(
      key: 'years',
      index: 5,
      desc: "years_hint",
      icon: Icons.document_scanner,
      onPressed: () {
        //
      },
    ),
  ];

  MyServices myServices = Get.find();
  @override
  void onInit() {
    configs = _confData;
    var schoolString = myServices.sharedPreferences.getString("school");
    if (schoolString != null) {
      school = SchoolModel.fromMap(jsonDecode(schoolString));
    }
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
