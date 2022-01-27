
import 'package:flutter/material.dart';
import 'package:wbsapp/value_config/layout_config.dart';

class EditBox extends StatelessWidget{
  EditBox(this.title, this.controller, this.numFlag);

  String title;
  TextEditingController controller;
  bool numFlag;

  @override
  Widget build(BuildContext context) {
    TextInputType keyboardInput = TextInputType.text;
    if(numFlag){
      keyboardInput = TextInputType.number;
    }
    return Container(
        width: editPage.editBoxWidth,
        child :Column(
          children: [
            Row(
              children: [
                Padding(padding: editPage.subtitleLeftMargin),
                Container(
                    width: editPage.textBoxWidth,
                    alignment: Alignment.center,
                    child: TextField(
                      controller:controller,
                      keyboardType: keyboardInput,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                        hintText: title,
                      ),)),],),
            Padding(padding:editPage.editBoxBottomMargin)
          ],));
  }

}