import 'package:flutter/material.dart';

class Interest extends StatelessWidget {
  const Interest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Center(
              child: Text("Interest MHS",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 0, horizontal: 50),
              child: Column(
                children: [
                  Text("Saya sendiri suka dengan jaringan wireless. Seperti bagaimana"
                      "mereka bisa berkomunikasi dan terhubung tanpa ada"
                      "kabel yang terhubung sama sekali."
                      "Juga seperti bagaimana mereka tidak diambil oleh orang lain yang"
                      "tidak bertanggung jawab"
                      ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
