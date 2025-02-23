import 'package:shared_preferences/shared_preferences.dart';

/// Helper class for managing SharedPreferences.
class PrefUtils {
  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  static SharedPreferences? _sharedPreferences;

  /// Initializes SharedPreferences if not already initialized.
  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  /// Clears all stored data in SharedPreferences.
  Future<void> clearPreferencesData() async {
    await _sharedPreferences?.clear();
  }

  /// Sets the theme data in SharedPreferences.
  Future<void> setThemeData(String value) async {
    await _sharedPreferences?.setString('themeData', value);
  }

  /// Retrieves the stored theme data. Returns 'primary' if not found.
  String getThemeData() {
    return _sharedPreferences?.getString('themeData') ?? 'primary';
  }
}
