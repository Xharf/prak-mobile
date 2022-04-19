import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pertemuan7/loginpage.dart';
import 'package:pertemuan7/model/user_model.dart';
import 'package:pertemuan7/profilepage.dart';
import 'package:pertemuan7/registerpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async{
  initiateLocalDB();
  runApp(const MyApp());
}

Future initiateLocalDB() async{
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>("user_model");
  return;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    autoLogIn();
  }
  void autoLogIn() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final bool? status = pref.getBool('login');
    if (status != true) {
        setState(() {
        isLogin = false;
      });
      return;
    } else {
      setState(() {
        isLogin = true;
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: isLogin? ProfilePage():LoginPage(),
      );
  }
}