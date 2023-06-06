import 'package:flutter/material.dart';

class CurrentSong extends StatelessWidget {
  final String imageUrl;
  final String gener;
  final String title;
  final String artist;
  final String album;
  final bool download;
  final bool monitize;
  const CurrentSong(
      {super.key,
      required this.imageUrl,
      required this.gener,
      required this.album,
      required this.artist,
      required this.monitize,
      required this.title,
      required this.download});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 49, 45, 45),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Image.asset(
              imageUrl,
              width: 50,
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
