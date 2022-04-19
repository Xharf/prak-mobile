import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

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
                child: Text("Profil MHS:",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 0, horizontal: 50),
              child: Column(
                children: [
                  Text("Nama : Shazi Awaludin"),
                  Text("NIM : 123190123"),
                  Text("Kelas : TPM-IFB"),
                  Text("Tempat/Tgl lahir : Bekasi, 23 Januari 2001"),
                  Text("Tempat Tinggal : TB.14/12A, Sleman."),
                  Text("Hobi : Penasaran"),
                ],
              ),
              )
            ],
          ),
        ),
    );
  }
}
