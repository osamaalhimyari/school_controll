import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/app/controllers/subjects_page_controller.dart';
import 'package:school_controll/app/data/model/subject_schema.dart';
import 'package:school_controll/core/functions/format_date.dart';

class SubjectsListView extends GetView<SubjectsPageController> {
  const SubjectsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: controller.subjects.length,
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemBuilder: (context, index) {
                final SubjectModel subject =
                    SubjectModel.fromMap(controller.subjects[index]);

                return Card(
                  elevation: 2,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: const Icon(
                      Icons.book_outlined,
                      size: 30,
                    ),
                    title: Text(
                      subject.name ?? "",
                      style: Get.textTheme.displaySmall
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Center(
                      child: Text(
                        "${formatDate("Created", subject.createdAt)}  •  ${formatDate("Updated", subject.updatedAt)}",
                        style: Get.textTheme.bodyMedium
                            ?.copyWith(color: Colors.grey[600]),
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.grey),
                    onTap: () {
                      // Handle subject tap (e.g., navigate to details page)
                    },
                  ),
                );
              },
            );
    });
  }
}
