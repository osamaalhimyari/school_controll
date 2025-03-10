import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/app/controllers/branches_page_controller.dart';
import 'package:school_controll/app/views/widgets/branchesPage/branches_list_view.dart';
import 'package:school_controll/core/shared/my_app_bar.dart';

class BranchesPage extends StatelessWidget {
  const BranchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    BranchesPageController controller = Get.put(BranchesPageController());
    return Scaffold(
      appBar: MyAppBar(
        title: "branches_Page",
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
      body: BranchesListView(),
    );
  }
}
