import 'package:flutter/material.dart';
import 'package:wbsapp/Data/data_repository/data_repository.dart';
import 'package:wbsapp/Data/data_repository/project_data.dart';
import 'package:wbsapp/pages/view_model/home_view_model.dart';
import 'package:wbsapp/ui_feature_widget/basic_page_widget/divider.dart';
import 'package:wbsapp/ui_feature_widget/home_component_widget/home_dismissed_widget.dart';
import 'package:wbsapp/ui_feature_widget/home_component_widget/project_card.dart';
import 'package:wbsapp/universal_function/logger_management.dart';
import 'package:wbsapp/value_config/layout_config.dart';


class WorkPage extends StatefulWidget{
  _WorkPage createState() => _WorkPage();
}

class _WorkPage extends State<WorkPage>{

  final HomeViewModel model = HomeViewModel();
  final LoggerManager logger = LoggerManager();
  final DataApplication _dataApplication = DataApplication();


  @override
  void initState(){
    // ToDo: Later implement this in dispose()
    setState(() {
      if(_dataApplication.dataRepository.isNotEmpty){
        for(ProjectData project in _dataApplication.dataRepository){
          model.todayTaskList(project);}
      }}
    );
  }

  @override
  Widget build(BuildContext context){
    return Container(
        color: ColorConfig.primaryBackground,
        child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
                children: [
                  Padding(padding: homePage.homePageAdjustPadding),
                  ProjectCard(),
                  Padding(padding: homePage.homePageAdjustPadding),
                  _toDayTaskView(context),
                  Padding(padding: homePage.homePageAdjustPadding),
                ],
            ),
        ),
    );
  }

  // Display the widget based on whether the project / task has been saved.
  Widget _toDayTaskView(BuildContext context){
    return _dataApplication.dataRepository.length > 0 ?
    _toDayTaskWidget(_taskListView(context), homePage.todayHeight) :
    _toDayTaskWidget(_noTaskWidget(), homePage.noTaskHeight);
  }

  Widget _toDayTaskWidget(Widget taskWidget, double widgetHeight){
    return Container(
      height: widgetHeight,
      width: homePage.todayWidth,
      padding: editPage.decorationSurroundedMargin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child:  Container(
          decoration: BoxDecoration(
            color: ColorConfig.primaryWidgetColor,
            border: Border.all(color: ColorConfig.customBorderColor),
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: homePage.todayTitlePadding,
                  child: Text("Today's Work"),
                ),
                DividerWidget(dividerWidget.dividerHomeWidth, Colors.black54),
                taskWidget,
                DividerWidget(dividerWidget.dividerHomeWidth,Colors.black54),
                Padding(padding: homePage.littleAdjustPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _noTaskWidget(){
    return Container(
      padding: homePage.noneTaskPadding,
      alignment: Alignment.topCenter,
      child: Text("You're up to date!!",
        style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),),
    );
  }

  // Display only Today's task
  Widget _taskListView(BuildContext context) {
    return Container(
        child: ListView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: model.taskList.length,
          itemBuilder: (context, index){
            return Dismissible(
              background: DismissedContainer(homePage.completionText,
                  ColorConfig.completeColor,
                  Alignment.centerLeft),
              secondaryBackground: DismissedContainer(homePage.editingText,
                  ColorConfig.editSwipeColor,
                  Alignment.centerRight),
              onDismissed: (direction){
                if (direction == DismissDirection.endToStart){
                  // Put some process that informs task want to be edited
                  logger.d('Task is swiped to left');}
                else{
                  // Put Some process that informs a task is completed
                  logger.d('Task is swiped to right');
                }
              },
              key: ValueKey<String>(model.taskList[index]),
              child: Column(
                children: [
                  DividerWidget(dividerWidget.dividerHomeWidth,
                      ColorConfig.customBorderColor),
                  Container(
                    height: 40,
                      alignment: Alignment.topLeft,
                      child: Text(model.taskList[index],
                        style: TextStyle(fontSize: 30),)),
                  _todayTaskDetail(model.taskDescList[index],
                      model.projectName[index]),
            ],
          ),
        );},
    ));
  }
  Widget _todayTaskDetail(String _description, String _project){
    if(_description.isEmpty) {
      return Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 5.0),
                child: Text(_project,
                    style: TextStyle(fontSize: 12)),
            ),
          ]),
      );
    }
    return Container(height: 70,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 125,
          alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 5.0),
            child: Text(_description,
              style: TextStyle(fontSize: 12)),
        ),
        Container(
          width: 200,
          alignment: Alignment.centerRight,
          child: Text(_project,
              style: TextStyle(fontSize: 12)),
        ),
      ],
    ));

  }
}
