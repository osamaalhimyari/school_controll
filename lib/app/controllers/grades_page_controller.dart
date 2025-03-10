import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/app/data/model/grade_model.dart';
import 'package:school_controll/app/data/remote/grades_page_data.dart';
import 'package:school_controll/app/views/widgets/gradesPage/adding_grades_bottom_sheet.dart';
import 'package:school_controll/core/functions/handling_transaction.dart';

class GradesPageController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController stageController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();

  var isLoading = false.obs;
  //
  RxList grades = [].obs;
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    isLoading.value = true;

    var response = await GradesPageData.getGradesData();
    if (handlingTransaction(response)) {
      grades.value = response.data ?? [];
    }
    isLoading.value = false;
  }

  onPressAddButton() {
    Get.bottomSheet(AddingGradeBottomSheet(), isScrollControlled: true);
  }

  // Save Grade Function
  void saveGrade() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      final gradeData = GradeModel(
        name: nameController.text,
        description: descriptionController.text,
        stage: stageController.text,
        capacity: int.tryParse(capacityController.text) ?? 0,
        status: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      var response = await GradesPageData.insertGradesData(gradeData.toMap());
      if (handlingTransaction(response)) {
        if (response.data != null) {
          grades.add(response.data);
        }
        clearFields();
        Get.back(); // Close BottomSheet
        isLoading.value = false;
      } else {
        Get.snackbar('Failure', 'Failed to add School!',
            backgroundColor: Colors.red);
      }
    }
  }

  // Clear input fields
  void clearFields() {
    nameController.clear();
    descriptionController.clear();
    stageController.clear();
    capacityController.clear();
  }
}
