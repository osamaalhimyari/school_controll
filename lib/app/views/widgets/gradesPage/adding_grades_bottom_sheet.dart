import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/app/controllers/grades_page_controller.dart';

class AddingGradeBottomSheet extends GetView<GradesPageController> {
  const AddingGradeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode nameFocus = FocusNode();
    final FocusNode descriptionFocus = FocusNode();
    final FocusNode stageFocus = FocusNode();
    final FocusNode capacityFocus = FocusNode();

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
            Text("Add Grade", style: Get.textTheme.displayMedium),
            const SizedBox(height: 16),

            // Grade Name
            _buildTextField(
              controller: controller.nameController,
              label: "Grade Name",
              focusNode: nameFocus,
              nextFocus: descriptionFocus,
              validator: (value) => value!.isEmpty ? "Enter grade name" : null,
            ),
            const SizedBox(height: 12),

            // Description
            _buildTextField(
              controller: controller.descriptionController,
              label: "Description",
              focusNode: descriptionFocus,
              nextFocus: stageFocus,
              validator: (value) => value!.isEmpty ? "Enter description" : null,
            ),
            const SizedBox(height: 12),

            // Stage
            _buildTextField(
              controller: controller.stageController,
              label: "Stage",
              focusNode: stageFocus,
              nextFocus: capacityFocus,
              validator: (value) => value!.isEmpty ? "Enter stage" : null,
            ),
            const SizedBox(height: 12),

            // Capacity
            _buildTextField(
              controller: controller.capacityController,
              label: "Capacity",
              isNumeric: true,
              focusNode: capacityFocus,
              validator: (value) => value!.isEmpty ? "Enter capacity" : null,
            ),
            const SizedBox(height: 20),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.saveGrade,
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

  // Custom TextField Builder
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
      onFieldSubmitted: (_) => nextFocus?.requestFocus(),
    );
  }
}
