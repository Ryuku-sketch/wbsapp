import 'package:flutter/material.dart';
import 'package:wbsapp/Universal_Function/logger_management.dart';
import 'package:wbsapp/value_config/layout_config.dart';

Widget mainAppBar(){
  final LoggerManager logger = LoggerManager();
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    actions: <Widget>[
      //ToDo: Modify the icons once the design is fixed
      IconButton(
        icon: appBarItem.searchIcon,
        onPressed: (){
          logger.d("Search Incon is Pressed");
          },
      ),
       IconButton(
          icon:appBarItem.configIcon,
         onPressed: () {
            logger.d("Settings Icon Pressed");
            },)],
    //ToDo: Delete the title when the appbar development is completed
    title: Text("TEST", style: TextStyle(color: Colors.black)),
    elevation: 0,
  );
}
