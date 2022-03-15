import 'dart:html';

import 'package:pertemuan4/home_page.dart';

import 'tourism_place.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Dummy"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final TourismPlace place = tourismPlaceList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomePage(username: place.name);
              }));
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Image.network(place.imageUrls[0],
                        width: 100,
                      ),
                      title: Text(place.name),
                      subtitle: Text(place.description),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget> [
                          Text("Tiket: ${place.ticketPrice}"),
                          const SizedBox(width: 10,),
                          TextButton(onPressed: (){},
                              child: const Text("Book"))
                        ],
                      ),
                    )
                  ],
                ),
              )
            ),
          );
        },
        itemCount: tourismPlaceList.length,
      ),
    );
  }
}
