import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/app/controllers/subjects_page_controller.dart';

class AddingSubjectBottomSheet extends GetView<SubjectsPageController> {
  const AddingSubjectBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode nameFocus = FocusNode();
    final FocusNode minFocus = FocusNode();
    final FocusNode maxFocus = FocusNode();

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
            Text("Add Subject", style: Get.textTheme.displayMedium),
            const SizedBox(height: 16),

            // Subject Name Field
            _buildTextField(
              controller: controller.nameController,
              label: "Subject Name",
              focusNode: nameFocus,
              nextFocus: minFocus, // Move to Min Point on submit
              validator: (value) =>
                  value!.isEmpty ? "Enter subject name" : null,
            ),
            const SizedBox(height: 12),

            // Min & Max Point Fields
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    controller: controller.minPointController,
                    label: "Min Point",
                    isNumeric: true,
                    focusNode: minFocus,
                    nextFocus: maxFocus, // Move to Max Point on submit
                    validator: (value) =>
                        value!.isEmpty ? "Enter min Point" : null,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildTextField(
                    controller: controller.maxPointController,
                    label: "Max Point",
                    isNumeric: true,
                    focusNode: maxFocus,
                    validator: (value) =>
                        value!.isEmpty ? "Enter max Point" : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.saveSubject,
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
