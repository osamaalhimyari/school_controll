import 'package:school_controll/backend/controllers/database_grade_controller.dart';
import 'package:school_controll/backend/controllers/database_semester_controller.dart';
import 'package:school_controll/backend/controllers/database_subject_controller.dart';
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
  RoutesManager.get("teachers", DatabaseTeacherController.index);
  RoutesManager.get("showTeacher", DatabaseTeacherController.show);
  //
  RoutesManager.post("subjects", DatabaseSubjectController.store);
  RoutesManager.get("subjects", DatabaseSubjectController.index);
  //
  RoutesManager.post("grades", DatabaseGradeController.store);
  RoutesManager.get("grades", DatabaseGradeController.index);
  //
  RoutesManager.post("semesters", DatabaseSemesterController.store);
  RoutesManager.get("semesters", DatabaseSemesterController.index);
}
