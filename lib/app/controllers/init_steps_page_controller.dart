import 'package:get/get.dart';
import 'package:school_controll/app/controllers/branches_page_controller.dart';
import 'package:school_controll/app/controllers/teachers_page_controller.dart';
import 'package:school_controll/app/data/model/branch_model.dart';
import 'package:school_controll/app/data/model/teacher_model.dart';
import 'package:school_controll/app/data/remote/branches_page_data.dart';
import 'package:school_controll/app/data/remote/teachers_page_data.dart';
import 'package:school_controll/core/constants/app_routes_names.dart';
import 'package:school_controll/core/services/services.dart';
import 'formsControllers/school_form_controller.dart';

class InitStepsPageController extends GetxController {
  var steperController = Get.put(SteperController());
  var branchController = Get.put(BranchesPageController());
  var schoolController = Get.put(SchoolFormController());
  var teacherController = Get.put(TeachersPageController());
  RxBool isLoading = false.obs;
  MyServices myServices = Get.find();
  @override
  void onInit() {
    initData();
    schoolController.status.listen(
      (value) {
        if (value) {
          steperController.completeStep();
          steperController.nextStep();
        }
      },
    );
    branchController.status.listen(
      (value) {
        if (value) {
          steperController.completeStep();
          steperController.nextStep();
        }
      },
    );
    // teacherController.status.listen(
    //   (value) {
    //     if (value) {
    //       steperController.completeStep();
    //       steperController.nextStep();
    //       myServices.sharedPreferences.setBool("inited", true);
    //       Get.offAllNamed(AppRoutes.start);
    //     }
    //   },
    // );
    super.onInit();
  }

// controller.steperController.allStepsCompleted
  initData() async {
    isLoading.value = true;
    await schoolController.getData();
    await getBranchData();
    await getTeacherData();
    isLoading.value = false;
  }

  getBranchData() async {
    var response = await BranchesPageData.getBranches();

    if (response.success && response.data.isNotEmpty) {
      var data = BranchModel.fromMap(response.data.first ?? {});
      await branchController.fillFields(data);
      steperController.completeStep();
      steperController.nextStep();
    }
  }

  getTeacherData() async {
    var response = await TeachersPageData.getFirstTeacherData();

    if (response.success && response.data != null) {
      var data = TeacherModel.fromMap(response.data ?? {});
      await teacherController.fillFields(data);
      steperController.completeStep();
      steperController.nextStep();
      myServices.sharedPreferences.setBool("inited", true);
      Get.offAllNamed(AppRoutes.start);
    }
  }
}

class SteperController extends GetxController {
  // Current step index
  var currentStep = 0.obs;
  // List to track completion status of each step
  var stepsCompleted = <bool>[false, false, false].obs;

  // Move to the next step
  void nextStep() {
    if (currentStep.value < stepsCompleted.length - 1 &&
        stepsCompleted[currentStep.value]) {
      currentStep.value++;
    }
  }

  // Move to the previous step
  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }

  // Mark the current step as completed
  void completeStep() {
    stepsCompleted[currentStep.value] = true;
  }

  // Check if all steps are completed
  bool get allStepsCompleted => stepsCompleted.every((step) => step);
}
