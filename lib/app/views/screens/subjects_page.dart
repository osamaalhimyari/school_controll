import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/app/controllers/subjects_page_controller.dart';
import 'package:school_controll/app/views/widgets/subjectsPage/subjects_list_view.dart';
import 'package:school_controll/core/shared/my_app_bar.dart';

class SubjectsPage extends StatelessWidget {
  const SubjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    SubjectsPageController controller = Get.put(SubjectsPageController());
    return Scaffold(
      appBar: MyAppBar(
        title: "subjects_Page",
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
      body: SubjectsListView(),
    );
  }
}
