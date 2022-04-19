import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pertemuan7/loginpage.dart';
import 'package:pertemuan7/main.dart';
import 'package:pertemuan7/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLogin = true;
  String? email;
  @override
  Widget build(BuildContext context) {
    getEmail();
    late Box<UserModel> localDB = Hive.box("user_model");
    var user;
    if(localDB.isNotEmpty)
      user = localDB.values.where((element) => element.email == email).first;
    return (isLogin)?Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 35.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 30.0,
                  ),
                ),
                Text(
                  user.fullname,
                  // "test",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    logoutUser();
                    Navigator.pushReplacement(
                        context, new MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  icon: Icon(
                    Icons.logout,
                    size: 30.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 70.0),
          CircleAvatar(
            backgroundImage: NetworkImage(
                "https://free2music.com/images/singer/2019/02/10/troye-sivan_2.jpg"),
            radius: 70.0,
          ),
          SizedBox(height: 20.0),
          Text(
            email!,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 30.0,
            ),
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: 20.0),
              Column(
                children: [
                  Text(
                    "29",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    "Following",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.3),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w100),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "121.9k",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    "Followers",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.3),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "7.5M",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    "Like",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.3),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              SizedBox(width: 20.0),
            ],
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Follow",
                  style: TextStyle(fontSize: 18.0),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(140.0, 55.0),
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              SizedBox(width: 15.0),
              OutlinedButton(
                onPressed: () {},
                child: Icon(Icons.mail_outline_outlined),
                style: OutlinedButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.black12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    fixedSize: Size(50.0, 60.0)),
              )
            ],
          ),
        ],
      ),
    ):LoginPage();
  }

  Future<Null> logoutUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('login', false);
    setState(() {
      isLogin = false;
    });
  }

  Future<Null> getEmail() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    email = pref.getString('email');
    setState(() {

    });
  }
}
