import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/app/controllers/teachers_page_controller.dart';
import 'package:school_controll/app/views/widgets/teachersPage/teachers_list_view.dart';
import 'package:school_controll/core/shared/my_app_bar.dart';

class TeachersPage extends StatelessWidget {
  const TeachersPage({super.key});

  @override
  Widget build(BuildContext context) {
    TeachersPageController controller = Get.put(TeachersPageController());
    return Scaffold(
      appBar: MyAppBar(
        title: "teachers_Page",
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
      body: TeachersListView(),
    );
  }
}
