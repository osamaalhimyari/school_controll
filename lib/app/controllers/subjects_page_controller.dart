import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/app/data/model/subject_schema.dart';
import 'package:school_controll/app/data/remote/subjects_page_data.dart';
import 'package:school_controll/app/views/widgets/subjectsPage/adding_subject_bottom_sheet.dart';
import 'package:school_controll/core/functions/handling_transaction.dart';

class SubjectsPageController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController minPointController = TextEditingController();
  final TextEditingController maxPointController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var isLoading = false.obs;
  //
  RxList subjects = [].obs;
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    isLoading.value = true;

    var response = await SubjectsPageData.getSubjectsData();
    if (handlingTransaction(response)) {
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
      if (handlingTransaction(response)) {
        if (response.data != null) {}
        subjects.add(response.data);
        //
        Get.back(); // Close BottomSheet
      } else {
        //
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
