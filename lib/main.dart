import 'package:flutter/material.dart';
import 'package:wbsapp/Universal_Function/data_management.dart';
import 'package:wbsapp/pages/test/test.dart';

void main() async{
  // ensureInitialized() is required if some kind of process took place
  // before runApp runs
  WidgetsFlutterBinding.ensureInitialized();
  // instantiate sharedPreference
  await DataManagement.initialize();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // set the color theme for the entire app
        theme:ThemeData(
          brightness: Brightness.light,
          dividerColor: Colors.transparent
      ),

      title: 'WBS APP Prototype',

      home: Test()
    );
  }
}
