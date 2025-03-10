// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:school_controll/app/controllers/formsControllers/teacher_form_controller.dart';
// import 'package:school_controll/app/controllers/teachers_page_controller.dart';
// import 'package:school_controll/app/views/widgets/teachersPage/adding_teacher_bottom_sheet.dart';

// class TeacherForm extends GetView<TeachersPageController> {
//   const TeacherForm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: SingleChildScrollView(
//           child:
//               // Column(
//               //     children: [
//               //       TextField(
//               //         controller: controller.nameController,
//               //         decoration: InputDecoration(labelText: 'Teacher Name'),
//               //       ),
//               //       SizedBox(height: 16),
//               //       TextField(
//               //         controller: controller.descriptionController,
//               //         decoration: InputDecoration(labelText: 'Description'),
//               //       ),
//               //       SizedBox(height: 16),
//               //       TextField(
//               //         controller: controller.phoneNumberController,
//               //         decoration: InputDecoration(labelText: 'Phone Number'),
//               //         keyboardType: TextInputType.phone,
//               //       ),
//               //       // SizedBox(height: 16),
//               //       // TextField(
//               //       //   controller: controller.birthPlaceController,
//               //       //   decoration: InputDecoration(labelText: 'Birth Place'),
//               //       // ),
//               //       SizedBox(height: 16),
//               //       TextField(
//               //         controller: controller.addressController,
//               //         decoration: InputDecoration(labelText: 'Address'),
//               //       ),
//               //       SizedBox(height: 16),
//               //       Obx(() {
//               //         return ListTile(
//               //           title: Text(
//               //               "Birth Date: ${controller.birthDate.value?.toLocal().toString().split(' ')[0] ?? 'Select'}"),
//               //           trailing: Icon(Icons.calendar_today),
//               //           onTap: () => controller.pickBirthDate(context),
//               //         );
//               //       }),
//               //       SizedBox(height: 16),
//               //       Obx(() {
//               //         return SwitchListTile(
//               //           title: Text(
//               //               "Gender: ${controller.gender.value ? "Male" : "Female"}"),
//               //           value: controller.gender.value,
//               //           onChanged: (value) => controller.gender.value = value,
//               //         );
//               //       }),
//               //       SizedBox(height: 16),
//               //       Obx(() {
//               //         return SwitchListTile(
//               //           title: Text(
//               //               "Status: ${controller.teacherStatus.value ? "Active" : "Inactive"}"),
//               //           value: controller.teacherStatus.value,
//               //           onChanged: (value) => controller.teacherStatus.value = value,
//               //         );
//               //       }),
//               //       SizedBox(height: 24),
//               //       ElevatedButton(
//               //         onPressed: () async {
//               //           await controller.insertTeacher();
//               //         },
//               //         child: Text('Save Teacher'),
//               //       ),
//               //     ],
//               //   ),
//               AddingTeacherBottomSheet()),
//     );
//   }
// }
