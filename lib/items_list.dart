import 'package:flutter/material.dart';


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
