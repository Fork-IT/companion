import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _preferences;
  static const _keyOnOff = 'OnOff';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setSwitchValue(int OnOff) async =>
      await _preferences!.setInt(_keyOnOff, OnOff);

  static int? getSwitchValue() => _preferences!.getInt(_keyOnOff);
}