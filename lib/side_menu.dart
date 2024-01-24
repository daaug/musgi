import 'package:flutter/material.dart';


class CstSideMenu extends StatefulWidget {
  Function changeTitle;

  CstSideMenu({super.key, required this.changeTitle});

  @override
  State<CstSideMenu> createState() => _CstSideMenuState();
}

class _CstSideMenuState extends State<CstSideMenu> {

  Color iconColor = Colors.cyan;
  double iconSize = 40.0;

  Widget txtBtn(String label, IconData icon, Color color, double iconWidth){
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: TextButton.icon(
        onPressed: () {
          widget.changeTitle(label);
          Navigator.pop(context);
        }, 
        icon: Icon(
          icon,
          color: color,
          size: iconWidth,
          semanticLabel: label,
        ), 
        style: TextButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 0),
          alignment: Alignment.centerLeft,
        ),
        label: Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 15.0,
          ),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column( // Column - Buttons 
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0,),
          child: const Text("Menu",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
        txtBtn('Current Playlist', Icons.music_note_rounded, iconColor, iconSize),
        txtBtn('All Songs', Icons.library_music_rounded, iconColor, iconSize),
        txtBtn('Albums', Icons.album_rounded, iconColor, iconSize),
        txtBtn('Playlists', Icons.playlist_play_rounded, iconColor, iconSize),
        txtBtn('Settings', Icons.settings_rounded, iconColor, iconSize),
      ],
    ); // Column - Buttons
  }
}
