import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Login Screen"),
        ),
        body: Center(
          child: Column(
            children: [

              const Padding(padding: EdgeInsets.only(
                  bottom: 40, left: 0, right: 0, top: 200
              ),
               child: Center(
                  child: FlutterLogo(),
                ),
              ),
              Padding(padding: const EdgeInsets.symmetric(
                  vertical: 0, horizontal: 15
              ) ,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    labelText: "Email",
                  ),
                ),
              ),
              Padding(padding: const EdgeInsets.symmetric(
                  vertical: 10, horizontal: 15
              ),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    labelText: "Password",
                  ),
                ),
              ),
              Padding(padding: const EdgeInsets.symmetric(
                  vertical: 15, horizontal: 15
              ),
                  child: ElevatedButton(onPressed: (){},
                    child: const Text("Login"),
                    style: ElevatedButton.styleFrom(
                      minimumSize:const Size.fromHeight(40)
                    ),
                  )
              ),
              const Text("Forgot password?"),
            ],
          ),
        ),
      )
    );
  }
}