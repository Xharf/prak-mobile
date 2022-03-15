import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'top_album.dart';

class SongList extends StatefulWidget {
  final int albumIdx;

  const SongList({Key? key, required this.albumIdx}) : super(key: key);

  @override
  State<SongList> createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  @override
  bool toggle = false;

  Widget build(BuildContext context) {
    final TopAlbum top_album = topAlbumList[widget.albumIdx];
    return Scaffold(
        appBar: AppBar(
          title: Text(top_album.albumName),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: IconButton(
                icon:
                    toggle ? Icon(Icons.favorite_border) : Icon(Icons.favorite),
                onPressed: () {
                  setState(() {
                    toggle = !toggle;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: IconButton(
                icon: Icon(Icons.share),
                onPressed: () async {
                  if (!await launch(top_album.albumurl)) throw 'Could not launch ${top_album.albumurl}';
                }
              ),
            )
          ],
        ),
        body: ListView(children: [
          Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Image.network(top_album.imageUrls),
                    ),
                    Text(
                      top_album.albumName,
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Text(top_album.singer),
                    Text("${top_album.releaseDate} | ${top_album.source}"),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Card(
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Text(
                          "# |",
                          style: TextStyle(color: Colors.white),
                        ),
                        title: Text(
                          "Song List",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                    child: SizedBox(height: 400, child: _build_songlist())),
              )
            ],
          )
        ]));
  }

  Widget _build_songlist() {
    TopAlbum top_album = topAlbumList[widget.albumIdx];
    return ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            child: Card(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  ListTile(
                    leading: Text("${index + 1} |"),
                    title: Text(top_album.songs[index]),
                  )
                ],
              ),
            )),
          );
        },
        itemCount: top_album.songs.length);
  }
}