
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wbsapp/Data/data_repository/data_repository.dart';
import 'package:wbsapp/Data/data_repository/project_data.dart';
import 'package:wbsapp/pages/view_model/home_view_model.dart';
import 'package:wbsapp/universal_function/logger_management.dart';
import 'package:wbsapp/value_config/layout_config.dart';

class ProjectCard extends StatefulWidget{
  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {

  final HomeViewModel model = HomeViewModel();
  final DataApplication dataModel = DataApplication();
  final LoggerManager logger = LoggerManager();


  @override
  void initState(){
    setState(() {
      model.progressValues = [];
      if(dataModel.dataRepository.length > 0){
        for (ProjectData project in dataModel.dataRepository){
        model.progressCalculation(project);}
      } else {
        // Default value for the progress bar
        model.progressValues.add(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _projectCardWidget(dataModel.dataRepository.length);

  }
  Widget _progressBar(int _index){
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: homePage.progressBarWidth,
          child: LinearProgressIndicator(
            value: model.progressValues[_index],
            semanticsLabel: 'Linear progress indicator',
          ),
        ));
  }

  //Delete this when the final version of app
  Widget _debugButton(int _index){
    return Container(
        child: TextButton(
          child: Text("Debug"),
          onPressed: (){
            logger.d('pressed');
            double randomDecimal = Random().nextDouble();
            while (randomDecimal > 0.4) {
              randomDecimal = Random().nextDouble();
            }
            if(model.progressValues[_index] >= 0.75 ){
              // ToDo: Delete this when this branch is merged to develop
              logger.d('test: Generated Decimal ===> $randomDecimal');
              setState(() {
                model.progressValues[_index] -=  randomDecimal;
              });
            } else {
              setState(() {
                model.progressValues[_index] += randomDecimal;
              });
            }
          },
        )
    );
  }

  Widget _progressBarMeasure(int _index){
    double displayProgress = (model.progressValues[_index] -
        (model.progressValues[_index] % 0.002)) * 100;
    return Container(
      padding: homePage.progressBarMeasurePadding,
      alignment: Alignment.centerRight,
        child: Text('${double.parse(displayProgress.toStringAsFixed(2))}%',
        style: TextStyle(fontSize: 12,
            color: ColorConfig.progressPercentageColor))
    );
  }

  Widget _projectName(String projectName, int _index){
    return Container(
      height:homePage.projectCardHeight,
      width: homePage.projectCardWidth,
      color: ColorConfig.primaryWidgetColor,
      padding:editPage.decorationSurroundedMargin,
      child: Card(
          child: Column(
            children: [
              Container(
                  child: Text(projectName)
              ),
              _debugButton(_index),
              Padding(padding: homePage.titleProgressBarPadding),
              _progressBarMeasure(_index),
              _progressBar(_index),
            ]),
      ),
    );
  }

  Widget _projectCardWidget(int listLength){
    if (listLength > 0){
      return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
              color: ColorConfig.primaryBackground,
              padding: homePage.projectCardSidePadding,
              height: homePage.projectCardHeight,
              width: 392,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dataModel.dataRepository.length,
                  itemBuilder: (context, index){
                      return Container(
                          child: _projectName(
                              dataModel.dataRepository[index].project,
                              index
                          ),
                      );
                  }),
          ),
      );
    }
    else {
      return Container(
          child: _defaultCardWidget('Add a New Project'),
      );
    }
  }

  Widget _defaultCardWidget(String projectName){
    return Container(
      height:homePage.projectCardHeight,
      width: homePage.projectCardWidth,
      color: ColorConfig.primaryWidgetColor,
      padding:editPage.decorationSurroundedMargin,
      child: Card(
        child: Column(
            children: [
              Container(
                  child: Text(projectName)
              ),
              _debugButton(0),
              Padding(padding: homePage.titleProgressBarPadding),
              _progressBarMeasure(0),
              _progressBar(0),
            ]),
      ),
    );
  }
}