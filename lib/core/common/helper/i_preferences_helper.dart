/// PreferencesHelper interface.
abstract class IPreferencesHelper {
  Future<List<String>?> getCoinList();
  Future<void> removeCoinList();
  Future<void> setCoinList(List<String> list);

  Future<List<String>?> getAlarmList();
  Future<void> removeAlarmList();
  Future<void> setAlarmList(List<String> list);
}
