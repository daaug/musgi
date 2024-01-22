import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Musgi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BaseScreen(),
    );
  }
}

double borderRadius = 20.0;
int foregroundColor = 0xFFd0d0d0;
int backgroundColor = 0xFF333333;
String iconAssets = "assets/icons/tinyfied";

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                      color: Color(foregroundColor),
                    ),
                    child: Column( // Column - Buttons 
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton( icon: const Icon(Icons.add), onPressed: () { setState(() { top.add(-top.length - 1); bottom.add(bottom.length); }); },),
                        IconButton(
                          onPressed: () => print('Current Playlist'), 
                          icon: Image(image: AssetImage("$iconAssets/icon_current-playlist.png"))
                        ),
                        IconButton(
                          onPressed: () => print('All Songs'), 
                          icon: Image(image: AssetImage("$iconAssets/icon_all-songs.png"))
                        ),
                        IconButton(
                          onPressed: () => print('Albums'), 
                          icon: Image(image: AssetImage("$iconAssets/icon_albums.png"))
                        ),
                        IconButton(
                          onPressed: () => print('Playlists'), 
                          icon: Image(image: AssetImage("$iconAssets/icon_playlists.png"))
                        ),
                        IconButton(
                          onPressed: () => print('Settings'), 
                          icon: Image(image: AssetImage("$iconAssets/icon_settings.png"))
                        ),
                      ],
                    ), // Column - Buttons
                  ), // Container - Buttons
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: MediaQuery.of(context).size.height * 0.80,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                      color: Color(foregroundColor),
                    ),
                    child: CustomScrollView(
                      slivers: <Widget>[
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return Container(
                                alignment: Alignment.center,
                                color: Colors.blue[200 + top[index] % 4 * 100],
                                height: 100 + top[index] % 4 * 20.0,
                                child: Text('Item: ${top[index]}'),
                              );
                            },
                            childCount: top.length,
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return Container(
                                alignment: Alignment.center,
                                color: Colors.blue[200 + bottom[index] % 4 * 100],
                                height: 100 + bottom[index] % 4 * 20.0,
                                child: Text('Item: ${bottom[index]}'),
                              );
                            },
                            childCount: bottom.length,
                          ),
                        ),
                      ],
                    ),
                  ), // Container - Lists Songs/Albums/Configs
                ],
              ), // Row
            ), // Container
            Container(
              height: MediaQuery.of(context).size.height * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                color: Color(foregroundColor),
              ),
            ), // Container - Current Playing
          ],
        ), // Main Column

      ),
    ); // Center
  }
}
