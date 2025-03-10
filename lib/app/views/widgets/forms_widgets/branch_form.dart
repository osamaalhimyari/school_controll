import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/app/controllers/branches_page_controller.dart';

class BranchForm extends GetView<BranchesPageController> {
  const BranchForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: controller.nameController,
              decoration: InputDecoration(labelText: 'Branch Name'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: controller.descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: controller.imageUriController,
              decoration: InputDecoration(labelText: 'Image URI'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: controller.cityController,
              decoration: InputDecoration(labelText: 'City'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: controller.addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: controller.phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            SizedBox(height: 16),
            Obx(() {
              return SwitchListTile(
                title: Text('Status'),
                value: controller.branchStatus.value,
                onChanged: (value) => controller.branchStatus.value = value,
              );
            }),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                await controller.saveData();
              },
              child: Text('Save Branch'),
            ),
          ],
        ),
      ),
    );
  }
}
