import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

double borderRadius = 5.0;
int foregroundColor = 0xFF1f1f1f;
int backgroundColor = 0xFF000000;
String iconAssets = "assets/icons/tinyfied";
double iconWidth = 40.0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Musgi',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Color(backgroundColor),
        body: const BaseScreen(),
      ),
      
    );
  }
}

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {

  List<int> top = <int>[];
  List<int> bottom = <int>[0];

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.95,
        //height: MediaQuery.of(context).size.height * 0.95,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container( // Menu Icon + Songs sorter
              height: MediaQuery.of(context).size.height * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                color: Color(foregroundColor),
              ),
            ),
            Container( // Lists
              height: MediaQuery.of(context).size.height * 0.65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                color: Color(foregroundColor),
              ),
              child: CstItemsList(),
            ),
            Container( // Currently Playing
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                color: Color(foregroundColor),
              ),
            ), // Container - Current Playing
          ],
        ),
      ), // SizedBox

    ); // Center
  }
}


class CstSideMenu extends StatefulWidget {
  const CstSideMenu({super.key});

  @override
  State<CstSideMenu> createState() => _CstSideMenuState();
}

class _CstSideMenuState extends State<CstSideMenu> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        color: Color(foregroundColor),
      ),
      child: Column( // Column - Buttons 
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () => print('Current Playlist'), 
            icon: Icon(
              Icons.music_note_rounded,
              color: Colors.pink,
              size: iconWidth,
              semanticLabel: "Current Playlist",
            ), 
          ),
          IconButton(
            onPressed: () => print('All Songs'), 
            icon: Icon(
              Icons.music_note,
              color: Colors.pink,
              size: iconWidth,
              semanticLabel: "All Songs",
            ), 
          ),
          IconButton(
            onPressed: () => print('Albums'), 
            icon: Icon(
              Icons.album_rounded,
              color: Colors.pink,
              size: iconWidth,
              semanticLabel: "Albums",
            ), 
          ),
          IconButton(
            onPressed: () => print('Playlists'), 
            icon: Icon(
              Icons.playlist_play_rounded,
              color: Colors.pink,
              size: iconWidth,
              semanticLabel: "Playlists",
            ), 
          ),
          IconButton(
            onPressed: () => print('Settings'), 
            icon: Icon(
              Icons.settings_rounded,
              color: Colors.pink,
              size: iconWidth,
              semanticLabel: "Settings",
            ), 
          ),
        ],
      ), // Column - Buttons
    ); // Container - Buttons 
  }
}

class CstItemsList extends StatefulWidget {
  const CstItemsList({super.key});

  @override
  State<CstItemsList> createState() => _CstItemsListState();
}

class _CstItemsListState extends State<CstItemsList> {

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                height: 20.0,
                child: Text('Item: '),
              );
            },
          ),
        ),
      ],
    ); // CustomScrollView - Actual elements list
  }
}
