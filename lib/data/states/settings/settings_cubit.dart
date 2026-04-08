import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/data/states/settings/settings_state.dart';
import 'package:flutter_starter/presenter/themes/themes.dart';

@singleton
class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState());

  void themeChanged(AppTheme theme) {
    emit(state.copyWith(theme: theme));
  }
}
