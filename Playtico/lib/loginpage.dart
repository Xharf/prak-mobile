import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'commonsubmitbutton.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final Future<SharedPreferences> _myPref = SharedPreferences.getInstance();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final String usernameDB = "mobile";
  final String passwordDB = "123";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _usernameController ,
            decoration: const InputDecoration(
              hintText: "Username",
            ),
          ),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
              hintText: "Password"
            ),
          ),
          _buttonLL(),
        ],
      ),
    );
  }

  Widget _buildLoginButton(){
    return CommonSubmitButton(
        labelButton: "Login",
        submitCallback: (value){
          String currentUsername = _usernameController.value.text;
          String currentPassword = _passwordController.value.text;

          _prosesLogin(currentUsername, currentPassword);
        }
        );
  }

  Widget _buildLogoutButton() {
    return CommonSubmitButton(
        labelButton: "Logout",
        submitCallback: (value){
          _prosesLogout();
        }
    );
  }

  Future<Widget> _buttonLL() async{
    bool login = await isLogin();
    return (login == true) ? _buildLoginButton() : _buildLogoutButton();
  }

  Future<bool> isLogin() async{
    SharedPreferences getPref = await _myPref;
    return (await getPref.getBool("login") == null)? false : true;
  }

  void _prosesLogin(String username, String password) async{
    if(username == usernameDB && password == passwordDB) {
      SharedPreferences getPref = await _myPref;
      await getPref.setBool("login", true);
    }
  }

  void _prosesLogout() async{
    SharedPreferences getPref = await _myPref;
    await getPref.setBool("login", false);
  }
}
