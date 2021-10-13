import 'package:shared_preferences/shared_preferences.dart';

import 'i_preferences_helper.dart';

class PreferencesHelper implements IPreferencesHelper {
  @override
  Future<List<String>?> getCoinList() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('coins');
  }

  @override
  Future<void> removeCoinList() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove('coins');
  }

  @override
  Future<void> setCoinList(List<String> list) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setStringList('coins', list);
  }

  @override
  Future<List<String>?> getAlarmList() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('alarms');
  }

  @override
  Future<void> removeAlarmList() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove('alarms');
  }

  @override
  Future<void> setAlarmList(List<String> list) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setStringList('alarms', list);
  }
}
