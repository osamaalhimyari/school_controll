import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/app/data/model/semester_model.dart';
import 'package:school_controll/app/data/remote/semesters_page_data.dart';
import 'package:school_controll/app/views/widgets/semestersPage/adding_smester_bottom_sheet.dart';
import 'package:school_controll/core/functions/handling_transaction.dart';

class SemestersPageController extends GetxController {
  final TextEditingController nameController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var isLoading = false.obs;
  //
  RxList semesters = [].obs;
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    isLoading.value = true;

    var response = await SemestersPageData.getSemestersData();
    if (handlingTransaction(response)) {
      semesters.value = response.data ?? [];
    }
    isLoading.value = false;
  }

  onPressAddButton() {
    Get.bottomSheet(AddingSmesterBottomSheet(), isScrollControlled: true);
  }

  void saveData() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      SemesterModel subjectData = SemesterModel(
        name: nameController.text.trim(),
        index: semesters.length - 1,
        status: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      var response =
          await SemestersPageData.insertSemestersData(subjectData.toMap());
      if (handlingTransaction(response)) {
        if (response.data != null) {
          print("${response.data}");
          semesters.add(response.data);
        }
        //
        Get.back(); // Close BottomSheet
      } else {
        //
      }

      // Clear fields after saving
      nameController.clear();
      isLoading.value = false;

      // Close BottomSheet
    }
  }
}
