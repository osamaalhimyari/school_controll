import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/app/controllers/semesters_page_controller.dart';

class AddingSmesterBottomSheet extends GetView<SemestersPageController> {
  const AddingSmesterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode nameFocus = FocusNode();

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
              label: "Semester Name",
              focusNode: nameFocus,
              validator: (value) =>
                  value!.isEmpty ? "Enter semester name" : null,
            ),

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
