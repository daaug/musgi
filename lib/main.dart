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
      home: BaseScreen(),
      
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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Henlo"),
        backgroundColor: Color(foregroundColor),
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        backgroundColor: Color(foregroundColor),
        child: CstSideMenu(),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.95,
          //height: MediaQuery.of(context).size.height * 0.95,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container( // Lists
                height: MediaQuery.of(context).size.height * 0.65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                  color: Color(foregroundColor),
                ),
                child: CstItemsList(),
              ),
              Container( // Currently Playing
                height: MediaQuery.of(context).size.height * 0.20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                  color: Color(foregroundColor),
                ),
              ), // Container - Current Playing
            ],
          ),
        ), // SizedBox

      ), // Center
    ); // Scaffold
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
    return Column( // Column - Buttons 
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton.icon(
          onPressed: () => print('Current Playlist'), 
          icon: Icon(
            Icons.music_note_rounded,
            color: Colors.pink,
            size: iconWidth,
            semanticLabel: "Current Playlist",
          ), 
          label: Text("Current Playlist"),
        ),
        TextButton.icon(
          onPressed: () => print('All Songs'), 
          icon: Icon(
            Icons.music_note,
            color: Colors.pink,
            size: iconWidth,
            semanticLabel: "All Songs",
          ), 
          label: Text("All Songs"),
        ),
        TextButton.icon(
          onPressed: () => print('Albums'), 
          icon: Icon(
            Icons.album_rounded,
            color: Colors.pink,
            size: iconWidth,
            semanticLabel: "Albums",
          ), 
          label: Text("Albums"),
        ),
        TextButton.icon(
          onPressed: () => print('Playlists'), 
          icon: Icon(
            Icons.playlist_play_rounded,
            color: Colors.pink,
            size: iconWidth,
            semanticLabel: "Playlists",
          ), 
          label: Text("Playlists"),
        ),
        TextButton.icon(
          onPressed: () => print('Settings'), 
          icon: Icon(
            Icons.settings_rounded,
            color: Colors.pink,
            size: iconWidth,
            semanticLabel: "Settings",
          ), 
          label: Text("Settings"),
        ),
      ],
    ); // Column - Buttons
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
