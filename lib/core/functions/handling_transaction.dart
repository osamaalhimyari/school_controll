import '../api/api_response.dart';

/// 📌 وصف الملف
///
/// [handlingTransaction]
///
///  هي دالة لمعالجة استجابات العمليات وتحديد حالة الطلب.
///
handlingTransaction(ApiResponse response) {
  if (!response.success) {
    return false;
  } else {
    return true;
  }
}

// Widget exceptionDialog(String message) {
//   return AlertDialog(
//     title: Text("Error"),
//     content: Text(message),
//     actions: [
//       TextButton(
//         onPressed: () => Get.back(),
//         child: Text("OK"),
//       ),
//     ],
//   );
// }
// Get.dialog(exceptionDialog(response.message ?? "An error occurred"));
