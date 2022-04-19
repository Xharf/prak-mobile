import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pertemuan7/main.dart';
import 'package:pertemuan7/model/user_model.dart';
import 'package:pertemuan7/registerpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pertemuan7/profilepage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late Box<UserModel> localDB = Hive.box<UserModel>("user_model");
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final String usernameDB = "mobile";
  final String passwordDB = "123";
  bool isLogin = false;

  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;
  double getBiglDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;


  @override
  Widget build(BuildContext context) {
    return (!isLogin)? Scaffold(
      backgroundColor: const Color(0xFFEEEEEE)  ,
      body: Stack(
        children: [
          Positioned(
            right: -getSmallDiameter(context) / 3,
            top: MediaQuery.of(context).size.height * 4/5,
            child: Container(
              width: getSmallDiameter(context),
              height: getSmallDiameter(context),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Color(0xFFB226B2), Color(0xFFFF6DA7)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Positioned(
            left: -getBiglDiameter(context) / 4,
            top: -getBiglDiameter(context) / 4,
            child: Container(
              width: getBiglDiameter(context),
              height: getBiglDiameter(context),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Color(0xFFB226B2), Color(0xFFFF4891)],
                      begin: Alignment.bottomCenter,
                      end: Alignment.centerRight)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      //border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.fromLTRB(20, 300, 20, 10),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            icon: const Icon(
                              Icons.email,
                              color: Color(0xFFFF4891),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.grey.shade100 )),
                            labelText: "Email",
                            hintText: "example@mail.com",
                            enabledBorder: InputBorder.none,
                            labelStyle: const TextStyle(color: Colors.grey)),
                        controller: _usernameController,
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            icon: const Icon(
                              Icons.vpn_key,
                              color: Color(0xFFFF4891),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.grey.shade100)),
                            labelText: "Password",
                            enabledBorder: InputBorder.none,
                            labelStyle: const TextStyle(color: Colors.grey)),
                        controller: _passwordController,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 45,
                        child: Container(
                          child: Material(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.transparent,
                            child: ElevatedButton(
                              child: Text("SIGN IN",
                              style: TextStyle(
                                color: Colors.white,
                                  fontWeight: FontWeight.w700
                              ),
                              ),
                              onPressed: (){
                                String currentUsername = _usernameController.text;
                                String currentPassword = _passwordController.text;

                                var user = localDB.values.where((element) => element.email == _usernameController.text).first;

                                if(currentUsername == user.email && currentPassword == user.password) {
                                  loginUser();
                                  Navigator.pushReplacement(
                                      context, new MaterialPageRoute(builder: (context) => ProfilePage()));
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    )
                                ),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFB226B2),
                                    Color(0xFFFF4891)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)),
                        ),
                      ),
                      FloatingActionButton.extended(
                        onPressed: () {},
                        elevation: 0,
                        backgroundColor: Color(0xFFBB001B),
                        icon: Icon(
                          Icons.mark_email_read,
                          color: Color(0xFFFFFFFF),
                        ),
                        label: Text("Gmail"),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Belum punya akun ?",
                      style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => const RegisterPage())
                          );
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFFFF4891),
                              fontWeight: FontWeight.w800),
                        )
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ) : ProfilePage();
  }

  Future<Null> loginUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('login', true);
    pref.setString('email', _usernameController.text);
    setState(() {
      isLogin = true;
    });
  }
}
