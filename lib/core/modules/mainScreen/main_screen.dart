import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                  appBar: AppBar(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      title: Text(
                          controller.bottomAppBar
                              .elementAt(controller.currentpage)
                              .title
                              .tr,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary)),
                      centerTitle: true,
                      actions: [
                        // SizedBox(width: 10),
                      ]),
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
