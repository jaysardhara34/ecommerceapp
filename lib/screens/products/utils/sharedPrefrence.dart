import 'package:shared_preferences/shared_preferences.dart';

void createUserSHP(String username, String password,String number) async {
  SharedPreferences _sharedpreferences = await SharedPreferences.getInstance();
  _sharedpreferences.setString('username', username);
  _sharedpreferences.setString('password', password);
  _sharedpreferences.setString('number', number);
}

Future<String?> getusername() async {
  SharedPreferences _sharedpreferences = await SharedPreferences.getInstance();
  return _sharedpreferences.getString('username');
}

Future<String?> getnumber() async {
  SharedPreferences _sharedpreferences = await SharedPreferences.getInstance();
  return _sharedpreferences.getString('number');
}

Future<String?> getuserpwd() async {
  SharedPreferences _sharedpreferences = await SharedPreferences.getInstance();
  return _sharedpreferences.getString('password');
}

void islogin(bool value) async {
  SharedPreferences _sharedpreferences = await SharedPreferences.getInstance();
  _sharedpreferences.setBool('loginstatus', value);
}

Future<bool?> getisloginSHP() async {
  SharedPreferences _sharedpreferences = await SharedPreferences.getInstance();
  return _sharedpreferences.getBool('loginstatus');
}

void cleanSHP() async {
  SharedPreferences _sharedpreferences = await SharedPreferences.getInstance();
  _sharedpreferences.clear();
}
