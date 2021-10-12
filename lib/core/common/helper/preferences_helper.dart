import 'package:shared_preferences/shared_preferences.dart';

import 'i_preferences_helper.dart';

class PreferencesHelper implements IPreferencesHelper {
  Future<List<String>?> getCoinList() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('coins');
  }

  Future<void> removeCoinList() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove('coins');
  }

  Future<void> setCoinList(List<String> list) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setStringList('coins', list);
  }

  Future<List<String>?> getAlarmList() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('alarms');
  }

  Future<void> removeAlarmList() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove('alarms');
  }

  Future<void> setAlarmList(List<String> list) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setStringList('alarms', list);
  }
}
