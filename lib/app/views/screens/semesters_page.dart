import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/app/controllers/semesters_page_controller.dart';
import 'package:school_controll/app/views/widgets/semestersPage/semesters_list_view.dart';
import 'package:school_controll/core/shared/my_app_bar.dart';

class SemestersPage extends StatelessWidget {
  const SemestersPage({super.key});

  @override
  Widget build(BuildContext context) {
    SemestersPageController controller = Get.put(SemestersPageController());
    return Scaffold(
      appBar: MyAppBar(
        title: "semesters_Page",
        actions: [
          IconButton(
              onPressed: () {
                controller.onPressAddButton();
              },
              icon: Icon(Icons.add_circle_outline, size: 30)),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: SemestersListView(),
    );
  }
}
