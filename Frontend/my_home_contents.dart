import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final List items = const [
    'Rock',
    'Pop',
    'Hip Hop',
    'Folk',
    'Country music',
    'Indie',
    'Love'
  ];
  final List colors = const [
    Colors.greenAccent,
    Colors.redAccent,
    Colors.blueAccent,
    Colors.lightGreenAccent,
    Colors.deepPurpleAccent,
    Colors.lightGreen,
    Colors.indigoAccent,
  ];
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverPadding(
          padding: EdgeInsets.all(8),
          sliver: SliverToBoxAdapter(
            child: Text(
              'OnlySongs is a specialized web platform for musicians to connect with fans, exhibit their talent,\n and sell merchandise, creating a dedicated community. It acts as a central hub for artists to engage, communicate, and showcase\n their music, fostering meaningful connections. With OnlySongs, musicians can enhance their online presence and\n establish a direct connection with their passionate fanbase.',
              style:
                  TextStyle(color: Colors.white, wordSpacing: 2, height: 1.5),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 25,
          ),
        ),
        SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              mainAxisExtent: 30),
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: colors[index],
              ),
              child: Text(
                items[index],
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            );
          },
          itemCount: items.length,
        )
      ],
    );
  }
}
