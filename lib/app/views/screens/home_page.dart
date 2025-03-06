import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_page_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.put(HomePageController());
    return Center(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
//
                controller.indertData();
              },
              child: Text("insert Data")),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
//
                controller.fetchData();
              },
              child: Text("show Data")),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
//
                controller.deleteData();
              },
              child: Text("delete Data")),
          SizedBox(
            height: 10,
          ),
          GetBuilder<HomePageController>(builder: (context) {
            return controller.school == null
                ? Text("no Data")
                : Text("${controller.school!.toMap()}");
          })
        ],
      ),
    );
  }
}
