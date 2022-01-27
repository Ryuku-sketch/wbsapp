
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wbsapp/UI_feature_widget/bottombar_try.dart';
import 'package:wbsapp/UI_feature_widget/bottombar_helper.dart';

class Test extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          children:[
            Container(
              child: Text('Sample')
            ),
            Padding(padding: EdgeInsets.all(20)),
            Container(
              child: ElevatedButton(
                child: Text('Go To main'),
                onPressed: (){Navigator.push(context, MaterialPageRoute(
                    builder: (context) => BottomBarView()));}
              )
            ),
            Container(
              child: ElevatedButton(
                child: Text('Go To Sample'),
                onPressed: (){Navigator.push(context, MaterialPageRoute(
                    builder: (context) => SampleBottomBar()));})),
          ]
        )
      ),
    );
  }
}