import 'package:councils/modules/settings/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingCubit extends Cubit<SettingStates>{

  SettingCubit():super(InitialState());

  static SettingCubit get(context)=>BlocProvider.of(context);

  bool isSwich=true;
  void changeButtonSwich(value)
  {
    isSwich=value;
    emit(SettingChangeButtonSwitchState());
  }

  bool isOptionShown=false;
  void showOption(){
     isOptionShown=!isOptionShown;
     emit(SettingShowOptionsState());
  }

  bool isThemeLight=true;
  void whiteMode()
  {
    isThemeLight=true;
    emit(SettingLightModeState());
  }

  void DarkMode()
  {
    isThemeLight=false;
    emit(SettingDarkModeState());
  }

  bool isLanguageShown=false;
  void languageOption(){
    isLanguageShown=!isLanguageShown;
    emit(SettingShowOptionsLanguageState());
  }

  bool isArabic=false;
  void arabicMode()
  {
    isArabic=true;
    emit(SettingArabicModeState());
  }

  void englishMode()
  {
    isArabic=false;
    emit(SettingEnglishModeState());
  }

}