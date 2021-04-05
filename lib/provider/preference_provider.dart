part of 'provider.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;

  PreferencesProvider({required this.preferencesHelper}) {
    _getNotification();
  }

  bool _isNotificationActive = false;
  bool get isNotificationActive => _isNotificationActive;

  void _getNotification() async {
    _isNotificationActive = await preferencesHelper.isNotificationActive;
    notifyListeners();
  }

  void enableNotification(bool value) {
    preferencesHelper.setNotification(value);
    _getNotification();
  }
}
