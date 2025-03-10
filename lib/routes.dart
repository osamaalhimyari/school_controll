import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:school_controll/app/views/screens/configs_page.dart';
import 'package:school_controll/app/views/screens/grades_page.dart';
import 'package:school_controll/app/views/screens/semesters_page.dart';
import 'package:school_controll/app/views/screens/teachers_page.dart';
import 'package:school_controll/core/middlewares/init_page_middleware.dart';
import 'app/views/screens/init_steps_page.dart';
import '/core/modules/mainScreen/main_screen.dart';
import '/core/constants/app_routes_names.dart';
import 'app/views/screens/subjects_page.dart';

List<GetPage<dynamic>>? routesPages = [
  // GetPage(
  //   name: AppRoutes.splash,
  //   page: () => SplashScreen(),
  //   // binding: MyBinding(), // ✅ Bind splash dependencies
  // ),
  GetPage(name: AppRoutes.start, page: () => const MainScreen()),
  GetPage(
      name: AppRoutes.initStepsPage,
      page: () => const InitStepsPage(),
      middlewares: [InitPageMiddleware()]),
  GetPage(name: AppRoutes.configPage, page: () => const ConfigsPage()),
  GetPage(name: AppRoutes.subjectsPage, page: () => const SubjectsPage()),
  GetPage(name: AppRoutes.gradesPage, page: () => const GradesPage()),
  GetPage(name: AppRoutes.semstersPage, page: () => const SemestersPage()),
  GetPage(name: AppRoutes.teachersPage, page: () => const TeachersPage()),
];
