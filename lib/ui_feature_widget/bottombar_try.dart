import 'package:flutter/material.dart';
import 'package:wbsapp/pages/test/blue.dart';
import 'package:wbsapp/pages/test/red.dart';
import 'package:wbsapp/pages/test/yellow.dart';
import 'package:wbsapp/value_config/PageRoute.dart';

class SampleBottomBar extends StatefulWidget{
  SampleBottomBar({Key key}) : super(key: key);
  _SampleBottomBar createState() => _SampleBottomBar();
}

class _SampleBottomBar extends State<SampleBottomBar> {
  final List<Widget> _pages = [Red(), Blue(),Yellow()];

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text('Red')
      ),
      BottomNavigationBarItem(
        icon: new Icon(Icons.search),
        title: new Text('Blue'),
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.info_outline),
          title: Text('Yellow')
      )
    ];
  }
  
  void _tapped(int index) {
    setState(() {
      bottomIndex.pageIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SAMPLE'),
      ),
      body: _pages[bottomIndex.pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomIndex.pageIndex,
        items: buildBottomNavBarItems(),
        onTap: _tapped,
      ),

    );
  }
}
