import 'package:fast_app_base/common/data/preference/item/preference_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreference {
  late final SharedPreferences _preferences;

  void init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  setCount(int count) {
    _preferences.setInt('count', count);
  }

  // null일 경우에는 0 디폴트 값 변환
  int getCount() {
    return _preferences.getInt('count') ?? 0;
  }
}
