import 'package:get/get.dart';
import '/backend/database_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 📌 وصف الملف

// [MyServices]
//
// يُستخدم لإعداد وتخزين الخدمات الأساسية التي يحتاجها التطبيق مثل [GetxService] هو
//
// SharedPreferences، Firebase , ،..
//
//init() وخدمات الإنترنت. يتم تهيئة هذه الخدمات عند بدء تشغيل التطبيق باستخدام دالة
//
class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    await DatabaseService().init("first.db");
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
  // await Get.putAsync(() => DatabaseService().init("first.db"));
}
