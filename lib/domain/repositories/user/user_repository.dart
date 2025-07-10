import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final SharedPreferences preferences;

  UserRepository({required this.preferences});

  Future<void> setWelcomeViewed(bool viewed) async {
    await preferences.setBool('welcomeViewed', viewed);
  }
}
