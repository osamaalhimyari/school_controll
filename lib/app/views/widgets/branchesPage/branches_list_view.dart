import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/app/controllers/branches_page_controller.dart';
import 'package:school_controll/app/data/model/branch_model.dart';
import 'package:school_controll/core/functions/format_date.dart';

class BranchesListView extends GetView<BranchesPageController> {
  const BranchesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (controller.branches.isEmpty) {
        return const Center(child: Text("No branches added yet"));
      }

      return ListView.builder(
        itemCount: controller.branches.length,
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemBuilder: (context, index) {
          final BranchModel semester =
              BranchModel.fromMap(controller.branches[index]);

          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                "${semester.name}",
                style: Get.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              subtitle: Center(
                child: Text(
                  "${formatDate("Created", semester.createdAt)}  •  ${formatDate("Updated", semester.updatedAt)}",
                  style: Get.textTheme.bodyMedium,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios,
                  size: 16, color: Colors.grey),
              onTap: () {
                // Handle semester tap (e.g., navigate to details page)
              },
            ),
          );
        },
      );
    });
  }
}
