import 'package:flutter/material.dart';
import 'package:pertemuan42x/tourism_place.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondScreen extends StatefulWidget {
  final int idx;
  const SecondScreen({Key? key, required this.idx}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    final TourismPlace place = tourismPlaceList[widget.idx];
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
        actions: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 7.5),
            child: IconButton(
              icon: Icon(Icons.image),
              onPressed: () async {
                if (!await launch(place.imageUrls[0])) throw 'Could not launch ${place.imageUrls[0]}';
              },
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Padding(padding: EdgeInsets.all(15),
              child: Image.network(place.imageUrls[0],
              width: MediaQuery.of(context).size.width/2,),
            ),
          )
        ],
      ),
    );
  }
}