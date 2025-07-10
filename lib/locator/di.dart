import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sub_notifier_app/domain/repositories/user/user_repository.dart';

final getIt = GetIt.instance;

Future<void> setupLocator({required SharedPreferences preferences}) async {
  getIt.registerSingleton(UserRepository(preferences: preferences));
}
