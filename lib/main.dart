import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/binding/binding.dart';
import '/core/constants/app_routes_names.dart';
import '/core/localization/controller/locale_controller.dart';
import '/core/localization/langs/translation.dart';
import '/core/localization/theme/dark_theme.dart';
import '/core/localization/theme/light_theme.dart';
import '/routes.dart';

import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LcaleController controller = Get.put(LcaleController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyLocales(),
      fallbackLocale: const Locale('en', 'US'),
      locale: controller.language ?? Locale('en', 'US'),
      title: "smart Shopping",
      theme: LightTheme.get(controller.getTextLocale()),
      darkTheme: DarkTheme.get(controller.getTextLocale()),
      initialBinding: MyBinding(),
      initialRoute:
          AppRoutes.initStepsPage, // ✅ تحديد الشاشة الأولى عند تشغيل التطبيق
      builder: (context, child) {
        return AnimatedTheme(
          data: controller.getTheme(),
          curve: Curves.easeInOut,
          child: child!,
        );
      },
      getPages: routesPages,
    );
  }
}
