import 'package:flutter/material.dart';
import 'profile.dart';
import 'interest.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Home Page"),
          ),
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                Text("Ini Halaman home UTS TPM",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
                ),
                _profileButton(context),
                SizedBox(
                  height: 20,
                ),
                _interestButton(context),
              ],
            ),
          ),
        ));
  }

  Widget _profileButton(BuildContext context){
    return Container(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return Profile();
                }));
          },
          child: const Text("Profil MHS",
          style: TextStyle(
            fontSize: 20
          ),),
        ),
    );
  }

  Widget _interestButton(BuildContext context){
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return Interest();
              }));
        },
        child: const Text("Interest MHS",
          style: TextStyle(
              fontSize: 20
          ),),
      ),
    );
  }
}
