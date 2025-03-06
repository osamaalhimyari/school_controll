import 'package:get/get.dart';

/// هذا الكلاس يتم تعريفه في
///
/// [MaterialِApp]
///
/// والذي يقوم بتعريف الملفات الاساسية
/// التي نحتاج تعريفها قبل بدء الصفحة الرئيسية
class MyBinding extends Bindings {
  @override
  void dependencies() async {
    // Get.put(CrudTrans());
    // Get.put(LocalTransaction());
    // Get.put(FavoritesPageController());
  }
}
