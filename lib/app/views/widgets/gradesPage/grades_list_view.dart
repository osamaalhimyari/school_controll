import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/app/controllers/grades_page_controller.dart';
import 'package:school_controll/app/data/model/grade_model.dart';

class GradesListView extends GetView<GradesPageController> {
  const GradesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (controller.grades.isEmpty) {
        return const Center(child: Text("No grades added yet"));
      }

      return ListView.builder(
        itemCount: controller.grades.length,
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemBuilder: (context, index) {
          GradeModel grade = GradeModel.fromMap(controller.grades[index]);

          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: Icon(
                controller.icon,
                size: 30,
              ),
              title: Text(
                grade.name ?? "",
                style: Get.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                "Stage: ${grade.stage} • Capacity: ${grade.capacity}",
                style: Get.textTheme.bodyMedium,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => controller.grades.removeAt(index),
              ),
            ),
          );
        },
      );
    });
  }
}
