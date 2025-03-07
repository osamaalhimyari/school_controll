import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/app/data/model/school_model.dart';
import 'package:school_controll/app/data/remote/init_steps_page_data.dart';
import 'package:school_controll/core/functions/handling_transaction.dart';

class SchoolFormController extends GetxController {
  // var steperController = Get.find<SteperController>();

  // TextEditingControllers for form fields
  final TextEditingController schoolNameController = TextEditingController();
  final TextEditingController schoolDescriptionController =
      TextEditingController();
  final TextEditingController schoolLogoUriController = TextEditingController();
  final TextEditingController schoolGOVController = TextEditingController();
  final TextEditingController schoolMinistryController =
      TextEditingController();
  final TextEditingController schoolEmailController = TextEditingController();

  // Status field as observable
  var schoolStatus = true.obs;
  RxBool status = false.obs;

  // @override
  // void onInit() {

  //   super.onInit();
  // }

  @override
  void onClose() {
    // Dispose controllers when the controller is removed
    schoolNameController.dispose();
    schoolDescriptionController.dispose();
    schoolLogoUriController.dispose();
    schoolGOVController.dispose();
    schoolMinistryController.dispose();
    schoolEmailController.dispose();
    super.onClose();
  }

  Future<void> getData() async {
    var response = await InitStepsPageData.getSchoolData();

    if (handlingTransaction(response) && response.data != null) {
      debugPrint("${response.data}");
      var data = SchoolModel.fromMap(response.data ?? {});
      schoolNameController.text = data.name ?? "";
      schoolDescriptionController.text = data.description ?? "";
      schoolLogoUriController.text = data.logoUri ?? "";
      schoolGOVController.text = data.gov ?? "";
      schoolMinistryController.text = data.ministry ?? "";
      schoolEmailController.text = data.email ?? "";
      schoolStatus.value = data.status ?? false;

      status.value = true;
    }
  }

  bool isStepCompleted() {
    return status.value == true;
  }

  Future<void> insertSchool() async {
    var schoolData = SchoolModel(
      name: schoolNameController.text,
      description: schoolDescriptionController.text,
      logoUri: schoolLogoUriController.text,
      gov: schoolGOVController.text,
      ministry: schoolMinistryController.text,
      email: schoolEmailController.text,
      status: schoolStatus.value,
    );

    var response = await InitStepsPageData.insertSchoolData(schoolData.toMap());
    if (handlingTransaction(response)) {
      status.value = true;
      Get.snackbar('Success', 'School added successfully!',
          backgroundColor: Colors.green);
    } else {
      status.value = false;
      Get.snackbar('Failure', 'Failed to add School!',
          backgroundColor: Colors.red);
    }
  }
}
