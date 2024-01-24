import 'package:flutter/material.dart';

import 'package:musgi/items_list.dart';
import 'package:musgi/side_menu.dart';


void main() {
  runApp(const MyApp());
}

double borderRadius = 5.0;
int foregroundColor = 0xFF1f1f1f;
int backgroundColor = 0xFF000000;
String iconAssets = "assets/icons/tinyfied";

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
  String appBarTitle = "Current Playlist";

  void changeTitle(String title){
    setState(() {
      appBarTitle = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: Color(foregroundColor),
        foregroundColor: Colors.white,
      ),
      drawer: Container(
        child: Drawer(
          backgroundColor: Color(foregroundColor),
          child: CstSideMenu(changeTitle: changeTitle),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.95,
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

