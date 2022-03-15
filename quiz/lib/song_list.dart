import 'package:flutter/material.dart';
import 'top_album.dart';

class SongList extends StatefulWidget {
  final int albumIdx;
  const SongList({Key? key, required this.albumIdx}) : super(key: key);

  @override
  State<SongList> createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  @override
  Widget build(BuildContext context) {

    final TopAlbum top_album = topAlbumList[widget.albumIdx];
    return Scaffold(
      appBar: AppBar(
        title: Text(top_album.albumName),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Image.network(top_album.imageUrls),
                  ),
                  Text(top_album.albumName,
                   style: TextStyle(
                     fontSize: 26,
                     fontWeight: FontWeight.bold
                   ),
                  ),
                  Text(top_album.singer),
                  Text("${top_album.releaseDate} | ${top_album.source}"),
                ],
              ),
            ),
            Container(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text("${top_album.songs.length}"),
                      )
                    );
                  }, itemCount: top_album.songs.length),
            )
          ],
        )
      )
    );
  }
}
