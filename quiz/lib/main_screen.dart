import 'top_album.dart';
import 'package:flutter/material.dart';
import 'song_list.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spoti-play"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              final TopAlbum top_album = topAlbumList[index];
              return Column(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context){
                            return SongList(albumIdx: index);
                          })
                      );
                    },
                    child:
                        Card(
                          child: Image.network(top_album.imageUrls,
                          width: MediaQuery.of(context).size.width/2-50,),
                        ),
                  ),
                ],
              );
            },
          itemCount: topAlbumList.length,
        ),
      )
    );
  }
}
