
import 'package:flutter/material.dart';
/// Modify this section


class ProjectModal extends StatelessWidget{


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:_testPopUp(context),
    );
  }
  Widget _testPopUp(context){
    // Try retrieving a certain pages size
    num screenHeight = MediaQuery.of(context).size.height * .90;
    num screenWidth = MediaQuery.of(context).size.width;
    showModalBottomSheet(context: context, builder: (BuildContext bc){
      return SingleChildScrollView(
          child: Container(
            width: screenWidth,
            height: screenHeight,
            color: Colors.white38,
            child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(50)),
                  Center(
                      child: Container(
                          child: Text('Queried!!!'))
                  ),
                  Padding(padding: EdgeInsets.all(25)),
                  Container(
                    child: Text('''This is just a sample ooooooooooooooooooo!!!!!
                        What? Why this text is so long?
                        The answer is........................
                        
                        
                        
                        
                        .......................... Practice!''', maxLines: 50,),
                  ),
                  Padding(padding: EdgeInsets.all(25)),
                  Container(
                      child: IconButton(
                          icon: Icon(Icons.cancel,size:50),
                          onPressed: (){
                            Navigator.of(context).pop();})),
                ]
            ),)
      );
    });
  }


}