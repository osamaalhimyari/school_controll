// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:school_controll/app/data/model/teacher_model.dart';
// import 'package:school_controll/app/data/remote/init_steps_page_data.dart';

// class TeacherFormController extends GetxController {
//   // Form controllers
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//   final TextEditingController phoneNumberController = TextEditingController();
//   final TextEditingController birthPlaceController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();

//   // Other fields
//   var birthDate = Rx<DateTime?>(null);
//   var gender = true.obs; // true = Male, false = Female
//   var teacherStatus = true.obs; // true = Active, false = Inactive
//   RxBool status = false.obs;

//   @override
//   void onClose() {
//     // Dispose of controllers to avoid memory leaks
//     nameController.dispose();
//     descriptionController.dispose();
//     phoneNumberController.dispose();
//     birthPlaceController.dispose();
//     addressController.dispose();
//     super.onClose();
//   }

//   Future<void> getData() async {
//     var response = await InitStepsPageData.getTeacherData();

//     if (response.success && response.data != null) {
//       debugPrint("${response.data}");
//       var data = TeacherModel.fromMap(response.data ?? {});
//       nameController.text = data.name ?? "";
//       descriptionController.text = data.description ?? "";
//       phoneNumberController.text = data.phoneNumber ?? "";
//       birthPlaceController.text = data.birthPlace ?? "";
//       addressController.text = data.address ?? "";
//       birthDate.value = data.birthDate;
//       gender.value = data.gender ?? true;
//       teacherStatus.value = data.status ?? false;
//       status.value = true;
//     }
//   }

//   Future<void> pickBirthDate(BuildContext context) async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: birthDate.value ?? DateTime.now(),
//       firstDate: DateTime(1950),
//       lastDate: DateTime.now(),
//     );

//     if (picked != null) {
//       birthDate.value = picked;
//     }
//   }

//   Future<void> insertTeacher() async {
//     var newTeacher = TeacherModel(
//       name: nameController.text,
//       description: descriptionController.text,
//       phoneNumber: phoneNumberController.text,
//       birthPlace: birthPlaceController.text,
//       address: addressController.text,
//       birthDate: birthDate.value,
//       gender: gender.value,
//       status: teacherStatus.value,
//       createdAt: DateTime.now(),
//       updatedAt: DateTime.now(),
//     );
//     var response =
//         await InitStepsPageData.insertTeacherData(newTeacher.toMap());

//     if (response.success) {
//       status.value = true;
//       Get.snackbar('Success', 'Teacher added successfully!',
//           backgroundColor: Colors.green);
//       Get.back(); // Close form after saving
//     } else {
//       status.value = false;

//       Get.snackbar('Error', 'Failed to add teacher',
//           backgroundColor: Colors.red);
//     }
//   }
// }
