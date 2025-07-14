import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final SharedPreferences preferences;

  UserRepository({required this.preferences});

  Future<void> setWelcomeViewed(bool viewed) async {
    await preferences.setBool('welcomeViewed', viewed);
  }

  bool get isViewed => preferences.getBool('welcomeViewed') ?? false;

  Future<void> setDarkMode(bool isDarkMode) async {
    await preferences.setBool('isDarkMode', isDarkMode);
  }

  bool get isDark => preferences.getBool('isDarkMode') ?? false;
}
