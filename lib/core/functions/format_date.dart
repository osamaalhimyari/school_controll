// Helper function to format dates
String formatDate(String prefix, DateTime? date) {
  if (date == null) {
    return "";
  }
  try {
    final DateTime parsedDate = date;
    return "$prefix: ${parsedDate.day}/${parsedDate.month}/${parsedDate.year}";
  } catch (e) {
    return ""; // Return original if parsing fails
  }
}
