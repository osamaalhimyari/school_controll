import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/app/data/model/subject_schema.dart';
import 'package:school_controll/app/data/remote/subjects_page_data.dart';
import 'package:school_controll/app/views/widgets/subjectsPage/adding_subject_bottom_sheet.dart';

class SubjectsPageController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController minPointController = TextEditingController();
  final TextEditingController maxPointController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var isLoading = false.obs;
  //
  RxList subjects = [].obs;
  var icon = Icons.abc;
  @override
  void onInit() {
    icon = Get.arguments['icon'] ?? Icons.abc;
    getData();
    super.onInit();
  }

  @override
  void onClose() {
    // Dispose of controllers to avoid memory leaks
    nameController.dispose();
    minPointController.dispose();
    maxPointController.dispose();

    super.onClose();
  }

  getData() async {
    isLoading.value = true;

    var response = await SubjectsPageData.getSubjectsData();
    if (response.success) {
      subjects.value = response.data ?? [];
    }
    isLoading.value = false;
  }

  onPressAddButton() {
    Get.bottomSheet(AddingSubjectBottomSheet(), isScrollControlled: true);
  }

  void saveSubject() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      SubjectModel subjectData = SubjectModel(
        name: nameController.text.trim(),
        maxPoint: int.parse(minPointController.text),
        minPoint: int.parse(maxPointController.text),
        status: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      var response =
          await SubjectsPageData.insertSubjectsData(subjectData.toMap());
      if (response.success) {
        if (response.data != null) {
          subjects.add(response.data);
        }
        //
        Get.back(); // Close BottomSheet
      } else {
        Get.snackbar('Error', '${response.error}', backgroundColor: Colors.red);
      }

      // Clear fields after saving
      nameController.clear();
      minPointController.clear();
      maxPointController.clear();
      isLoading.value = false;

      // Close BottomSheet
    }
  }
}
