import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/init_steps_page_controller.dart';
import '../widgets/forms_widgets/branch_form.dart';
import '../widgets/forms_widgets/school_form.dart';
import '../widgets/forms_widgets/teacher_form.dart';

class InitStepsPage extends StatelessWidget {
  const InitStepsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final InitStepsPageController controller =
        Get.put(InitStepsPageController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi-Step Form'),
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Expanded(
                    child: Stepper(
                      currentStep:
                          controller.steperController.currentStep.value,
                      onStepContinue: () {
                        controller.steperController.nextStep();
                      },
                      onStepCancel: () {
                        controller.steperController.previousStep();
                      },
                      onStepTapped: (step) {
                        // Allow tapping only if the step is completed
                        if (controller.steperController.stepsCompleted[step]) {
                          controller.steperController.currentStep.value = step;
                        }
                      },
                      steps: [
                        Step(
                          title: Text('Step 1'),
                          content: SchoolForm(),
                          isActive:
                              controller.steperController.currentStep.value >=
                                  0,
                          state: controller.steperController.stepsCompleted[0]
                              ? StepState.complete
                              : StepState.indexed,
                        ),
                        Step(
                          title: Text('Step 2'),
                          content: BranchForm(),
                          isActive:
                              controller.steperController.currentStep.value >=
                                  1,
                          state: controller.steperController.stepsCompleted[1]
                              ? StepState.complete
                              : StepState.indexed,
                        ),
                        Step(
                          title: Text('Step 3'),
                          content: TeacherForm(),
                          isActive:
                              controller.steperController.currentStep.value >=
                                  2,
                          state: controller.steperController.stepsCompleted[2]
                              ? StepState.complete
                              : StepState.indexed,
                        ),
                      ],
                    ),
                  ),
                  // Obx(() {
                  //   return ElevatedButton(
                  //     onPressed: controller.steperController.allStepsCompleted
                  //         ? () {
                  //             // All steps completed, submit the form
                  //             Get.snackbar('Success', 'All steps completed!');
                  //           }
                  //         : null,
                  //     child: Text('Submit'),
                  //   );
                  // }),
                ],
              );
      }),
    );
  }
}
