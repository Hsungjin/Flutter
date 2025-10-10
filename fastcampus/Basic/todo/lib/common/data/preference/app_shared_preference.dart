import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreference {

  AppSharedPreference._();

  static AppSharedPreference instance = AppSharedPreference._();

  static const keyCount = 'count';
  static const keyLaunchCount = 'launch_count';

  late SharedPreferences _preferences;

  static init() async {
    instance._preferences = await SharedPreferences.getInstance();
  }

  static setCount(int count) {
    instance._preferences.setInt(keyCount, count);
  }

  // null일 경우에는 0 디폴트 값 변환
  static int getCount() {
    return instance._preferences.getInt(keyCount) ?? 0;
  }

  static void setLaunchCount(int count) {
    instance._preferences.setInt(keyLaunchCount, count);
  }

  static int getLaunchCount() {
    return instance._preferences.getInt(keyLaunchCount) ?? 0;
  }
}
