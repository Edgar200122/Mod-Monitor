import 'package:intl/intl.dart';

abstract class AppConstants {
  static List<Map<String, String>> get dates {
    final today = DateTime.now();
    final dateFormat = DateFormat('dd');
    final dayLabelFormat = DateFormat('EEE');
    List<Map<String, String>> dateList = [];

    for (int i = -3; i <= 3; i++) {
      final date = today.add(Duration(days: i));
      dateList.add({
        "day": dateFormat.format(date),
        "label": dayLabelFormat.format(date),
      });
    }

    return dateList;
  }

  static int get defaultSelectedIndex => 3; 
}
