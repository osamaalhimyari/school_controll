import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/app/controllers/grades_page_controller.dart';
import 'package:school_controll/app/views/widgets/gradesPage/grades_list_view.dart';
import 'package:school_controll/core/shared/my_app_bar.dart';

class GradesPage extends StatelessWidget {
  const GradesPage({super.key});

  @override
  Widget build(BuildContext context) {
    GradesPageController controller = Get.put(GradesPageController());
    return Scaffold(
      appBar: MyAppBar(
        title: "grades_Page",
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
      body: GradesListView(),
    );
  }
}
