import 'package:flutter/material.dart';
import 'package:wbsapp/Universal_Function/logger_management.dart';
import 'package:wbsapp/ui_feature_widget/basic_page_widget/divider.dart';
import 'package:wbsapp/ui_feature_widget/edit_component_widget/edit_boxes/custom_edit_box_widget.dart';
import 'package:wbsapp/ui_feature_widget/edit_component_widget/edit_boxes/edit_box_widget.dart';
import 'package:wbsapp/value_config/layout_config.dart';
import 'package:wbsapp/pages/view_model/editing_view_model.dart';

class EditingPage extends StatefulWidget{
  EditingPage();
  _EditingManager createState() => _EditingManager();
}

class _EditingManager extends State<EditingPage>{

  // Util Controllers
  final EditingViewModel model = EditingViewModel();
  final LoggerManager logger = LoggerManager();

  int _currentIndex = 1;

  @override
  void initState(){
    setState(() {
      model.initialize();
    });
    super.initState();
  }

  @override
  void dispose(){
    model.initialize();
    super.dispose();
  }


  // ToDo: add scrollable to Task-Detail entry channel
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            color: ColorConfig.primaryBackground,
            padding: editPage.pageTopBottomMargin,
            child: Center(
                child: Column(
                  children: [
                    Padding(padding: editPage.adjustedMargin),
                    Container(
                        width: editPage.titleWidth,
                        padding: editPage.titleLeftMargin,
                        child: Text('Edit Page',
                          style: TextStyle(
                              fontSize: editPage.titleFontSize),)),
                    Padding(padding:editPage.adjustedMargin),
                    // ToDO: Add Details of tasks feature => priority / due date / description / estimated work time
                    _editDecoratedProject(),
                    Padding(padding: editPage.adjustedMargin,),
                    _editDecoratedTask(),
                    Container(
                      color: Colors.cyan[50],
                      width: editPage.savingWidth,
                      height: editPage.savingHeight,
                      child:TextButton(
                        child:Text('Add',
                            style: TextStyle(
                                fontSize: editPage.saveFontSize)
                        ),
                        onPressed: () { model.saveChanges(); },
                      ),),
                    Padding(padding: editPage.adjustedMargin),
                  ],)
            )),
      ));
  }

  // Final product of the EditBox warped by the decorated border
  Widget _editDecoratedTask(){
    // Return task with details layout
    return Container(
      padding: editPage.decorationSurroundedMargin,
      // ClipRReact: round the corner
      child:ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: ColorConfig.primaryWidgetColor,
            border: Border.all(color: ColorConfig.customBorderColor),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
              children: [
                _injectNewTask(),
                _editTaskButton()
              ],
          ),
        ),
      ),
    );
  }

  Widget _editDecoratedProject(){
    return Container(
      padding: editPage.decorationSurroundedMargin,
      child:ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: ColorConfig.primaryWidgetColor,
            border: Border.all(color: ColorConfig.customBorderColor),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(padding: editPage.adjustedMargin),
                // https://pub.dev/packages/expandable
                EditBox(editPage.subtitleProject, model.controllerList, false),
                EditBox(editPage.subtitleDescription, model.controllerDes, false),
              ],
          ),
        ),
      ),
    );
  }

  // Button: Add/Remove a expandable taskBox
  Widget _editTaskButton(){
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                icon: editPage.addIcon,
                tooltip: editPage.addText,
                onPressed: (){
                  setState(() {
                    _currentIndex = model.taskIndexIncrement();
                    model.getNewTaskWidget(_taskEntryChannel(_currentIndex));
                  });
                }),
            IconButton(
                icon: editPage.removeIcon,
                tooltip: editPage.removeText,
                onPressed: (){
                  logger.d("Remove button is pressed");
                  setState(() {
                    model.taskWidgetList.remove(model.taskWidgetList.last);
                  });
                }),
          ],));
  }

  // Widget for a new entry channel
  Widget _taskEntryChannel(int _taskIndex){
    return  Container(
        child: Column(children: [
          ExpansionTile(
            title: Text(editPage.subtitleTask),
            initiallyExpanded: false,
            children: [
              Padding(padding: editPage.adjustedMargin),
              // https://pub.dev/packages/expandable
              EditBox(editPage.subtitleTask,
                  model.textControllerList[_taskIndex][0], false),
              EditBox(editPage.subtitleDetail,
                  model.textControllerList[_taskIndex][1], false),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // is this look better?
                  CustomEditBox(editPage.subtitleEstimation,
                      model.textControllerList[_taskIndex][2],true,
                      editPage.customBoxWidth),
                  Padding(padding: editPage.adjustedMargin2,),
                  CustomEditBox(editPage.subtitleDue,
                      model.textControllerList[_taskIndex][3],true,
                      editPage.customBoxWidth)
                ],
              ),
            ],
          ),
          DividerWidget(dividerWidget.dividerEditWidth,
          ColorConfig.customBorderColor)], )
    );
  }

  // Inject a new entry channel
  Widget _injectNewTask(){
    if(model.taskWidgetList.length == 0){
      model.taskWidgetList = [_taskEntryChannel(model.taskIndex)];}
    return Column(children: model.taskWidgetList);
  }
}
