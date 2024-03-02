import 'package:shared_preferences/shared_preferences.dart';

const kIsLoggedIn = 'islogged_in';

const kToken = 'token';

class SharedPreferencesRepo {
  static SharedPreferences? _prefs;
  static SharedPreferencesRepo? _instance;

  SharedPreferencesRepo._(SharedPreferences prefs) {
    _prefs = prefs;
  }

  static SharedPreferencesRepo get instance => _instance!;

  static Future<void> initialize() async {
    _instance ??=
        SharedPreferencesRepo._(await SharedPreferences.getInstance());
  }

  void isLoggedIn(bool value) {
    _prefs!.setBool(kIsLoggedIn, value);
  }

  void signOut() {
    _prefs!.remove(kToken);
    // _prefs!.remove(kIsPhoneNumberLogin);
  }

  void storeFCMToken(String? token) {
    if (token != null) {
      _prefs!.setString(kToken, token);
    }
  }

  String? get getToken => _prefs?.getString(kToken);

  bool? get checkLogIn => _prefs?.getBool(kIsLoggedIn);
}
