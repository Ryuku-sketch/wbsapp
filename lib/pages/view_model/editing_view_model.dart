import 'package:flutter/material.dart';
import 'package:wbsapp/pages/model/editing_model.dart';
import 'package:wbsapp/universal_function/logger_management.dart';

// Place for transforming and handling data
class EditingViewModel {

  final EditingModel model = EditingModel();
  final LoggerManager logger = LoggerManager();

  // keyboard Controllers
  TextEditingController controllerList = TextEditingController();
  TextEditingController controllerDes = TextEditingController();

  // Task Widget List
  List<Widget> taskWidgetList = [];
  Map<int, List<TextEditingController>> textControllerList = {
    1: [
      // Title
      TextEditingController(),
      // Description
      TextEditingController(),
      // Estimated Time
      TextEditingController(),
      // Due
      TextEditingController()]};

  int taskIndex = 1;

  void initialize() {
    controllerList.clear();
    controllerDes.clear();
  }

  // Method: call the change evaluation process for saving
  void saveChanges() {
    model.changeEvaluator(controllerList.text, controllerDes.text,
        textControllerList);
    }

  // Method: xIncrements the inde
  int taskIndexIncrement(){
    taskIndex = model.indexIncrement(textControllerList.keys.length);
    textControllerList = model.addTaskController(textControllerList,taskIndex);
    return taskIndex;
  }

  // Method: add a new controller with an index for TEC
  void getNewTaskWidget(Widget newTaskWidget){
    taskWidgetList.add(newTaskWidget);
  }

}
