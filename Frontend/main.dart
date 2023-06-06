import 'package:flutter/material.dart';
import 'package:songs/my_home_contents.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(const MainApp());
}

FilePickerResult? input;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Row(
            children: const [MyIconBar(), Expanded(child: MyPageContainer())],
          ),
        ));
  }
}

class MyIconBar extends StatefulWidget {
  const MyIconBar({super.key});

  @override
  State<MyIconBar> createState() => _MyIconBarState();
}

class _MyIconBarState extends State<MyIconBar> {
  List colors = [1, 0, 0, 0];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 18, 18, 18),
      child: Column(
        children: [
          const Flexible(
            child: FractionallySizedBox(
              heightFactor: 0.1,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(
                () {
                  for (int i = 0; i < 4; i++) {
                    colors[i] = 0;
                  }
                  colors[0] = 1;
                },
              );
            },
            icon: Icon(
              Icons.mic_outlined,
              color: findColour(0),
            ),
            tooltip: 'Home',
          ),
          const Flexible(
            child: FractionallySizedBox(
              heightFactor: 0.25,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(
                () {
                  for (int i = 0; i < 4; i++) {
                    colors[i] = 0;
                  }
                  colors[1] = 1;
                },
              );
            },
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: findColour(1),
            ),
            tooltip: 'Cart',
          ),
          const Flexible(
            child: FractionallySizedBox(
              heightFactor: 0.25,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(
                () {
                  for (int i = 0; i < 4; i++) {
                    colors[i] = 0;
                  }
                  colors[2] = 1;
                },
              );
            },
            icon: Icon(
              Icons.add,
              color: findColour(2),
            ),
            tooltip: 'Download',
          ),
          const Flexible(
            child: FractionallySizedBox(
              heightFactor: 0.25,
            ),
          ),
          IconButton(
            onPressed: () async {
              FilePickerResult? input = await FilePicker.platform.pickFiles();
              if (input == null) {
                print('file is not selected');
              } else {
                PlatformFile file = input.files.first;
              }
              setState(
                () {
                  for (int i = 0; i < 4; i++) {
                    colors[i] = 0;
                  }
                  colors[3] = 1;
                },
              );
            },
            icon: Icon(
              Icons.upload_outlined,
              color: findColour(3),
            ),
            tooltip: 'Upload',
          ),
        ],
      ),
    );
  }

  Color findColour(int i) {
    if (colors[i] == 1) {
      return Colors.orange;
    }
    return Colors.white;
  }
}

class MyPageContainer extends StatelessWidget {
  const MyPageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MyTopNavigationBar(),
        Expanded(
          child: Stack(children: [
            Container(
                color: const Color.fromARGB(255, 54, 55, 59),
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: MyHomePage(),
                )),
          ]),
        )
      ],
    );
  }
}

class MyTopNavigationBar extends StatefulWidget {
  const MyTopNavigationBar({super.key});

  @override
  State<MyTopNavigationBar> createState() => _MyTopNavigationBarState();
}

class _MyTopNavigationBarState extends State<MyTopNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      color: const Color.fromARGB(255, 18, 18, 18),
      height: height * 0.07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // FloatingSearchBar(
          //   builder: (context, transition) {
          //     return Container();
          //   },
          //   width: 200,
          // ),
          // const Flexible(
          //   child: FractionallySizedBox(
          //     widthFactor: 0.2,
          //   ),
          // ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Sign In',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Flexible(
            child: FractionallySizedBox(
              widthFactor: 0.01,
            ),
          ),
        ],
      ),
    );
  }
}
