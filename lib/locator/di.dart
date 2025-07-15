import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sub_notifier_app/bloc/theme/theme_cubit.dart';
import 'package:sub_notifier_app/domain/repositories/user/user_repository.dart';
import 'package:talker_flutter/talker_flutter.dart';

final getIt = GetIt.instance;
final talker = TalkerFlutter.init();

Future<void> setupLocator({required SharedPreferences preferences}) async {
  getIt.registerSingleton(talker);
  getIt.registerSingleton(UserRepository(preferences: preferences));
  getIt.registerSingleton(ThemeCubit(getIt<UserRepository>()));
}
