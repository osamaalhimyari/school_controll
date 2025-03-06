import '/backend/database/schemas/Semester_schema.dart';
import '/backend/database/schemas/branch_schema.dart';
import '/backend/database/schemas/estimate_schema.dart';
import '/backend/database/schemas/grade_schema.dart';
import '/backend/database/schemas/parent_schema.dart';
import '/backend/database/schemas/priviladge_schema.dart';
import '/backend/database/schemas/result_schema.dart';
import '/backend/database/schemas/school_schema.dart';
import '/backend/database/schemas/student_schema.dart';
import '/backend/database/schemas/subject_schema.dart';
import '/backend/database/schemas/teacher_schema.dart';
import '/backend/database/schemas/year_schema.dart';
import 'package:sqflite/sqflite.dart';

class InitialMigration {
  Future<void> run(Database db) async {
    final batch = db.batch();
    batch.execute(SchoolSchema.create());
    batch.execute(BranchSchema.create());
    batch.execute(GradeSchema.create());
    batch.execute(PriviladgeSchema.create());
    batch.execute(SubjectSchema.create());
    batch.execute(SemesterSchema.create());
    batch.execute(TeacherSchema.create());
    batch.execute(YearSchema.create());
    batch.execute(EstimateSchema.create());
    batch.execute(ParentSchema.create());
    batch.execute(StudentSchema.create());
    batch.execute(ResultSchema.create());
    await batch.commit();
  }
}
