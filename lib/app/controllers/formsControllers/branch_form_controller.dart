import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/app/data/model/branch_model.dart';
import 'package:school_controll/app/data/remote/init_steps_page_data.dart';
import 'package:school_controll/core/functions/handling_transaction.dart';

class BranchFormController extends GetxController {
  // final steperController = Get.find<SteperController>();

  // Form field controllers
  final branchNameController = TextEditingController();
  final branchDescriptionController = TextEditingController();
  final branchImageUriController = TextEditingController();
  final branchCityController = TextEditingController();
  final branchAddressController = TextEditingController();
  final branchPhoneNumberController = TextEditingController();
  final branchStatus = false.obs;

  RxBool status = false.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onClose() {
    // Dispose controllers to avoid memory leaks
    branchNameController.dispose();
    branchDescriptionController.dispose();
    branchImageUriController.dispose();
    branchCityController.dispose();
    branchAddressController.dispose();
    branchPhoneNumberController.dispose();
    super.onClose();
  }

  Future<void> getData() async {
    var response = await InitStepsPageData.getBranchData();

    if (handlingTransaction(response) && response.data != null) {
      var data = BranchModel.fromMap(response.data ?? {});

      branchNameController.text = data.name ?? '';
      branchDescriptionController.text = data.description ?? '';
      branchImageUriController.text = data.imageUri ?? '';
      branchCityController.text = data.city ?? '';
      branchAddressController.text = data.address ?? '';
      branchPhoneNumberController.text = data.phoneNumber ?? '';
      branchStatus.value = data.status ?? false;

      status.value = true;
      // steperController.completeStep();
      // steperController.nextStep();
    }
  }

  Future<void> insertBranch() async {
    final data = BranchModel(
      name: branchNameController.text,
      description: branchDescriptionController.text,
      imageUri: branchImageUriController.text,
      city: branchCityController.text,
      address: branchAddressController.text,
      phoneNumber: branchPhoneNumberController.text,
      status: branchStatus.value,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    var response = await InitStepsPageData.insertBranchData(data.toMap());
    if (handlingTransaction(response)) {
      status.value = true;
      // steperController.completeStep();
      // steperController.nextStep();
      Get.snackbar('Success', 'Branch added successfully!',
          backgroundColor: Colors.green);
    } else {
      status.value = false;
      Get.snackbar('Failure', 'Failed to add Branch!',
          backgroundColor: Colors.red);
    }
  }

  bool isStepCompleted() {
    return status.value == true;
  }
}
