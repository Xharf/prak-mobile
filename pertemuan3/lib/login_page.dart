import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Login Page"),
          ),
          body: Column(
            children: [
              _usernameField(),
              _passwordField(),
              _loginButton(context)
            ],
          )
      ),

    );
  }

  Widget _usernameField(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onChanged: (value){
          username = value;
        },
        decoration: const InputDecoration(
            hintText: "Username",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color:  Colors.blue),
            )
        ),
      ),
    );
  }

  Widget _passwordField(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onChanged: (value){
          password = value;
        },
        obscureText: true,
        decoration: const InputDecoration(
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: (isLoginSuccess) ? Colors.blue : Colors.red,
        ),
        onPressed: (){
          String pesan = "";
          if(username == 'Shazi' && password == "udin"){
            setState(() {
              pesan = "login success";
              isLoginSuccess = true;
            });
          } else {
            setState(() {
              pesan =  "Login gagal";
              isLoginSuccess = false;
            });
          }
          SnackBar snackBar = SnackBar(content: Text(pesan));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text("Login"),
      ),
    );
  }
}
