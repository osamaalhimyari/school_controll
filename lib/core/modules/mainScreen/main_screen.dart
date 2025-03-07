import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/core/shared/my_app_bar.dart';
import 'mainscreen_controller.dart';
import '/core/functions/alert_exit_app.dart';
import 'widgets/bottom_nav_bar.dart';
import 'widgets/custom_drawer.dart';

///هذه الصفحة عباره عن غلاف للصفحة الرئيسية و صفحة الاشعارات
///NavBarButtons فيها ازرار تنقل سفلية
///
/// drawer و فيها ازرار جانبية

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainscreenController());

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) => alertExitApp(),
      child: GetBuilder<MainscreenController>(
          builder: (controller) => Directionality(
                textDirection: TextDirection.ltr,
                child: Scaffold(
                  appBar: MyAppBar(
                    title: controller.bottomAppBar
                        .elementAt(controller.currentpage)
                        .title
                        .tr,
                  ),
                  drawer: controller.useDrower ? const CustomDrawer() : null,
                  bottomNavigationBar: const BottomNavBar(),
                  body: Directionality(
                      textDirection: controller.localeController.getDirection(),
                      child: controller.bottomAppBar
                          .elementAt(controller.currentpage)
                          .page),
                ),
              )),
    );
  }
}
