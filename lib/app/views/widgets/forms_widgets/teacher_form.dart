import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/app/controllers/teachers_page_controller.dart';
import 'package:school_controll/app/views/widgets/teachersPage/adding_teacher_bottom_sheet.dart';

class TeacherForm extends GetView<TeachersPageController> {
  const TeacherForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(child: AddingTeacherBottomSheet()),
    );
  }
}
