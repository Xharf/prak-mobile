import 'package:flutter/material.dart';
import 'package:pertemuan42x/second_screen.dart';
import 'package:pertemuan42x/tourism_place.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.ac_unit_rounded),
          title: Text("Halaman Utama"),

        ),
        body: ListView.builder(
            itemCount: tourismPlaceList.length,
            itemBuilder: (context, index) {
              final TourismPlace place = tourismPlaceList[index];
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SecondScreen(idx: index);
                  }));
                },
                child: Card(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Image.network(
                              place.imageUrls[0],
                              width: MediaQuery.of(context).size.width / 3,
                            ),
                          ],
                        ),
                      ),
                      Text(place.name),
                    ],
                  ),
                ),
              );
            }));
  }
}
