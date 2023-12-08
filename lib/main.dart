import 'package:assignment_test/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? globalSharedPreference;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  globalSharedPreference = await SharedPreferences.getInstance();
  runApp(MyApp());
}
