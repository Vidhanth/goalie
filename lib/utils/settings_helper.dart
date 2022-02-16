import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsHelper {
  final GetStorage _appSettings = GetStorage();

  static final SettingsHelper instance = SettingsHelper();

  Future<void> initializeSettings() async {
    await _appSettings.writeIfNull('darkmode', false);
  }

  bool get isDarkMode => _appSettings.read('darkmode');

  void toggleTheme() {
    Get.changeThemeMode(isDarkMode ? ThemeMode.light : ThemeMode.dark);
    _appSettings.write('darkmode', !isDarkMode);
  }
}
