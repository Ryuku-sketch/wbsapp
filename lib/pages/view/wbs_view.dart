import 'package:flutter/material.dart';
import 'package:wbsapp/Data/data_repository/project_data.dart';
import 'package:wbsapp/value_config/sample_list.dart';
import 'package:wbsapp/value_config/layout_config.dart';



class WBSView extends StatefulWidget {
  _WBSManager createState() => _WBSManager();
}


/// This is the pages for displaying the tasks with some descriptions!!
/// This pages enables navigating us to detailed tasks!!

class _WBSManager extends State<WBSView>{

  final ProjectData projectData = ProjectData('test', 'Test', {'test': [1]});

  List<Item> _tasks;
  @override
  void initState() {
    setState(() {
      _tasks = generateItems(projectData.projectList.length);
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context){
    return  SingleChildScrollView(
          child: Center(
            child: Column(
                children:[
                  Divider(),
                  Padding(padding: EdgeInsets.all(WbsPage.padTitle)),
                Container(
                  alignment: Alignment.center,
                  width: WbsPage.tasksWidth,
                  height: WbsPage.tasksHeight,
                  child: Text('Your Works',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: WbsPage.fontTitle),
                  ),
                  padding: EdgeInsets.only(bottom: WbsPage.padBottom),),
                Container(
                  child: tasksList(),
                  alignment: Alignment.center,
                ),
               Padding(padding:EdgeInsets.all(WbsPage.padList)),
                  Container(
                    child: Text('Over!!',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: WbsPage.fontBottom),),
                alignment: Alignment.bottomRight,
              ),
              ]),
          ),
        );
  }


  Widget tasksList(){
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded){
        setState(() {
          _tasks[index].isExpanded = !isExpanded;
        });},
      children: _tasks.map<ExpansionPanel>((Item item){
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded){
            /// I think we can modify here to add sub tasks with some
            /// descriptions for each!!
            return ListTile(
                title: Text(item.headerValue));},
          body:ListTile(
            title: Text(item.expandedValue),
            subtitle: Text("Of Course!! Sampleeeeeeee!!!"),),
          isExpanded: item.isExpanded,);
      },).toList(),);
  }

}