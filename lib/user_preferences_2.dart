import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences2 {
  static SharedPreferences? _preferences2;
  static const total_score = 'OnOff';

  static Future init() async =>
      _preferences2 = await SharedPreferences.getInstance();

  static Future setSwitchValue(int score) async =>
      await _preferences2!.setInt(total_score, score);

  static int? getSwitchValue() => _preferences2!.getInt(total_score);
}