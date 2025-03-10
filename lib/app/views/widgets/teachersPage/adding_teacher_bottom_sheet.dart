import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/app/controllers/teachers_page_controller.dart';

class AddingTeacherBottomSheet extends GetView<TeachersPageController> {
  const AddingTeacherBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode nameFocus = FocusNode();
    final FocusNode discription = FocusNode();
    final FocusNode number = FocusNode();
    final FocusNode address = FocusNode();
    final FocusNode birthDate = FocusNode();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Add Semester", style: Get.textTheme.displayMedium),
            const SizedBox(height: 16),

            // Semester Name Field
            _buildTextField(
              controller: controller.nameController,
              label: "name",
              focusNode: nameFocus,
              nextFocus: discription,
              validator: (value) =>
                  // value!.isEmpty ? "Teacher Name" :
                  null,
            ),
            const SizedBox(height: 16),
            // Semester Name Field
            _buildTextField(
              controller: controller.descriptionController,
              label: "discription",
              focusNode: discription,
              nextFocus: number,
              validator: (value) =>
                  // value!.isEmpty ? "Teacher Name" :
                  null,
            ),
            const SizedBox(height: 16),
            // Semester Name Field
            _buildTextField(
              controller: controller.phoneNumberController,
              label: "number",
              isNumeric: true,
              focusNode: number,
              nextFocus: address,
              validator: (value) =>
                  // value!.isEmpty ? "Teacher Name" :
                  null,
            ),
            const SizedBox(height: 16),
            // Semester Name Field
            _buildTextField(
              controller: controller.addressController,
              label: "address",
              // isNumeric: true,
              focusNode: address,
              nextFocus: birthDate,
              validator: (value) =>
                  // value!.isEmpty ? "Teacher Name" :
                  null,
            ),
            SizedBox(height: 16),
            Obx(() {
              return ListTile(
                title: Text(
                    "Birth Date: ${controller.birthDate.value?.toLocal().toString().split(' ')[0] ?? 'Select'}"),
                trailing: Icon(Icons.calendar_today),
                focusNode: birthDate,
                onTap: () => controller.pickBirthDate(context),
              );
            }),
            SizedBox(height: 16),
            Obx(() {
              return SwitchListTile(
                title: Text(
                    "Gender: ${controller.gender.value ? "Male" : "Female"}"),
                value: controller.gender.value,
                onChanged: (value) => controller.gender.value = value,
              );
            }),
            SizedBox(height: 16),
            Obx(() {
              return SwitchListTile(
                title: Text(
                    "Status: ${controller.teacherStatus.value ? "Active" : "Inactive"}"),
                value: controller.teacherStatus.value,
                onChanged: (value) => controller.teacherStatus.value = value,
              );
            }),

            const SizedBox(height: 20),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.saveData,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text("Save", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Custom TextField Builder with Focus Support
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool isNumeric = false,
    FocusNode? focusNode,
    FocusNode? nextFocus,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
      textInputAction:
          nextFocus != null ? TextInputAction.next : TextInputAction.done,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: validator,
      onFieldSubmitted: (_) => nextFocus?.requestFocus(), // Move to next field
    );
  }
}
