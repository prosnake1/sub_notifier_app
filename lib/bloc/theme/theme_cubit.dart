import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sub_notifier_app/domain/repositories/user/user.dart';
import 'package:sub_notifier_app/theme/theme.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit(this._repository) : super(_lightTheme);
  final UserRepository _repository;

  static final _lightTheme = AppTheme.lightTheme;
  static final _darkTheme = AppTheme.darkTheme;

  void enableTheme() {
    final isDark = _repository.isDark;
    emit(isDark ? _darkTheme : _lightTheme);
  }
}
