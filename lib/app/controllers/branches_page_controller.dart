import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/app/data/model/branch_model.dart';
import 'package:school_controll/app/data/remote/branches_page_data.dart';
import 'package:school_controll/app/data/remote/init_steps_page_data.dart';
import 'package:school_controll/app/views/widgets/branchesPage/adding_bracnhes_bottom_sheet.dart';

class BranchesPageController extends GetxController {
  // Form field controllers
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageUriController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final branchStatus = false.obs;

  RxBool status = false.obs;

  RxList branches = [].obs;
  RxBool isLoading = false.obs;
  IconData? icon = Icons.abc;
  @override
  void onInit() {
    icon = Get.arguments == null
        ? Icons.abc
        : (Get.arguments['icon'] ?? Icons.abc);
    getData();
    super.onInit();
  }

  @override
  void onClose() {
    // Dispose controllers to avoid memory leaks
    nameController.dispose();
    descriptionController.dispose();
    imageUriController.dispose();
    cityController.dispose();
    addressController.dispose();
    phoneNumberController.dispose();
    super.onClose();
  }

  Future<void> fillFields(BranchModel data) async {
    nameController.text = data.name ?? '';
    descriptionController.text = data.description ?? '';
    imageUriController.text = data.imageUri ?? '';
    cityController.text = data.city ?? '';
    addressController.text = data.address ?? '';
    phoneNumberController.text = data.phoneNumber ?? '';
    branchStatus.value = data.status ?? false;
  }

  Future<void> getData() async {
    isLoading.value = true;

    var response = await BranchesPageData.getBranches();

    if (response.success && response.data != null) {
      branches.value = (response.data);
    }
    print("${response.data}");
    isLoading.value = false;
  }

  Future<void> saveData() async {
    final data = BranchModel(
      name: nameController.text,
      description: descriptionController.text,
      imageUri: imageUriController.text,
      city: cityController.text,
      address: addressController.text,
      phoneNumber: phoneNumberController.text,
      status: branchStatus.value,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    var response = await InitStepsPageData.insertBranchData(data.toMap());
    if (response.success) {
      status.value = true;
      branches.add(response.data);
      Get.snackbar('Success', 'Branch added successfully!',
          backgroundColor: Colors.green);
    } else {
      status.value = false;
      Get.snackbar('Failure', 'Failed to add Branch!',
          backgroundColor: Colors.red);
    }
  }

  onPressAddButton() {
    Get.bottomSheet(AddingBracnhesBottomSheet(), isScrollControlled: true);
  }
}
