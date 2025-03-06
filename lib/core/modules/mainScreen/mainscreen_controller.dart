import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/views/screens/home_page.dart';
import '/core/modules/mainScreen/widgets/bottom_nav_bar.dart';
import '/core/modules/mainScreen/widgets/custom_drawer.dart';

import '/core/localization/controller/locale_controller.dart';
import '/core/localization/langs/translation.dart';

abstract class _MainScreenController extends GetxController {
  changePage(int index);
  initBottomNavBar();
  initDrower();
}

class MainscreenController extends _MainScreenController {
  LcaleController localeController = Get.put(LcaleController());
  int currentpage = 0;

  List<NavButton> bottomAppBar = [];
  List<DrowerButton> drower = [];

  bool useDrower = true;
  @override
  void onInit() {
    initBottomNavBar();
    initDrower();
    super.onInit();
  }

  @override
  initDrower() {
    drower = [
      // DrowerButton(
      //   icon: Icons.favorite_outline,
      //   title: Translate.favorites,
      //   onTapped: () async {
      //     Get.toNamed(AppRoutes.favorite);
      //   },
      // ),
    ];
  }

  @override
  initBottomNavBar() {
    bottomAppBar = [
      NavButton(
          page: const HomePage(),
          title: Translate.homePage,
          icon: Icons.home_outlined),
      // NavButton(
      //   page: const HomePage(),
      //   title: Translate.homePage,
      //   icon: Icons.add_outlined,
      //   isFlatButtin: true,
      //   onTapped: (index) async {
      //     AuthController authController = Get.find();
      //     final UserModel? userFire = authController.getUser();
      //     if (userFire != null) {
      //       Get.toNamed(AppRoutes.addnewPlace);
      //     } else {
      //       print("empty");
      //       await showSignInBottomSheet();
      //     }
      //   },
      // ),
      // NavButton(
      //     page: ProfilePage(),
      //     title: Translate.profile,
      //     icon: Icons.location_history_outlined),
    ];
  }

  @override
  changePage(int index) {
    currentpage = index;
    update();
  }
}
