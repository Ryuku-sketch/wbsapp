
import 'package:flutter/material.dart';
import 'package:wbsapp/Universal_Function/data_management.dart';
import 'package:wbsapp/Universal_Function/logger_management.dart';
import 'package:collection/collection.dart';

class Red extends StatefulWidget {
  @override
  _RedState createState() => _RedState();
}

class _RedState extends State<Red> {
  /// defining necessary classes
  final DataManagement dataManager = DataManagement();
  final LoggerManager logger = LoggerManager();
  Function equal = const ListEquality().equals;

  // test data
  List<String> sample = ['Task1', 'Task2'];
  List<String> desSample = ['Task1 : 1', 'Task2: 2'];

  /// test whether the below result is true
  /// data is present without saving it, but will disappear when it is saved
  /// once it is loaded, then debug will print it correctly

  void testDataManagement(){
    logger.d("Task: ${equal(sample, ['Task1', 'Task2'])}");
    logger.d("Description: ${equal(desSample, ['Task1 : 1', 'Task2: 2'])}");
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:
                Column(
                  children: [
                    Padding(padding:EdgeInsets.all(20.0)),
                    Container(
                        child: TextButton(
                          child: Text('Save !!', style: TextStyle(fontSize:20.0)),
                          onPressed: (){
                          })),
                    Padding(padding:EdgeInsets.all(20.0)),
                    Container(
                        child: TextButton(
                          child: Text('Test !!', style: TextStyle(fontSize:20.0)),
                          onPressed: (){
                            testDataManagement();},)),

                ],));
  }
}