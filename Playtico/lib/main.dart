import 'package:flutter/material.dart';
import 'package:playtico/loginpage.dart';

void main(){
  runApp(const Playtico());
}

class Playtico extends StatelessWidget {
  const Playtico({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
