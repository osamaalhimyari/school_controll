import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/app/controllers/configs_page_controller.dart';
import 'package:school_controll/app/views/widgets/configPage/config_school_card.dart';
import 'package:school_controll/app/views/widgets/configPage/configs_gride_view.dart';
import 'package:school_controll/core/shared/my_app_bar.dart';

class ConfigsPage extends StatelessWidget {
  const ConfigsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ConfigsPageController());
    return Scaffold(
      appBar: MyAppBar(title: "config Page"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ConfigSchoolCard(),
            ConfigsGridView(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: ConfigCard(
                  icon: Icon(Icons.route_outlined),
                  text: "set_relations",
                  onPressed: () {
                    //
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
