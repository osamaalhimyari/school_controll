import 'package:school_controll/backend/controllers/database_teacher_controller.dart';

import '/backend/controllers/database_branch_controller.dart';
import '/backend/controllers/database_school_controller.dart';
import '/backend/routes/routes_manager.dart';

void defineRoutes() {
  ///  middlewares: [authMiddleware]
  RoutesManager.get("schools", DatabaseSchoolController.show);
  RoutesManager.post("schools", DatabaseSchoolController.store);
//
  RoutesManager.get("branches", DatabaseBranchController.show);
  RoutesManager.post("branches", DatabaseBranchController.store);
  //
  RoutesManager.post("teachers", DatabaseTeacherController.store);
  RoutesManager.get("teachers", DatabaseTeacherController.show);
}
