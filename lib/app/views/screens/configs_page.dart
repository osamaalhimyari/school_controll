import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/app/controllers/configs_page_controller.dart';
import 'package:school_controll/app/views/widgets/configPage/configs_gride_view.dart';
import 'package:school_controll/core/shared/my_app_bar.dart';

class ConfigsPage extends StatelessWidget {
  const ConfigsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ConfigsPageController());
    return Scaffold(
      appBar: MyAppBar(title: "config Page"),
      body: ConfigsGridView(),
    );
  }
}
