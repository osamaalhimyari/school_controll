import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/core/constants/app_routes_names.dart';
import 'package:school_controll/core/services/services.dart';

class InitPageMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    MyServices myServices = Get.find();
    bool isInitial = myServices.sharedPreferences.getBool("inited") ?? false;
    if (isInitial) {
      return RouteSettings(name: AppRoutes.start);
    }
    return null;
  }
}
