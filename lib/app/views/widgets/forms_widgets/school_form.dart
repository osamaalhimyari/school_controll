import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/app/controllers/formsControllers/school_form_controller.dart';

class SchoolForm extends GetView<SchoolFormController> {
  const SchoolForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: controller.schoolNameController,
              decoration: InputDecoration(labelText: 'School Name'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: controller.schoolDescriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: controller.schoolLogoUriController,
              decoration: InputDecoration(labelText: 'Logo URI'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: controller.schoolGOVController,
              decoration: InputDecoration(labelText: 'GOV'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: controller.schoolMinistryController,
              decoration: InputDecoration(labelText: 'Ministry'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: controller.schoolEmailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16),
            Obx(() {
              return SwitchListTile(
                title: Text('Status'),
                value: controller.schoolStatus.value,
                onChanged: (value) => controller.schoolStatus.value = value,
              );
            }),
            SizedBox(height: 24),
            if (!controller.isStepCompleted())
              ElevatedButton(
                onPressed: () async {
                  await controller.insertSchool();
                },
                child: Text('Save School'),
              ),
          ],
        ),
      ),
    );
  }
}
