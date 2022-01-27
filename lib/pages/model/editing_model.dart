import 'package:flutter/material.dart';
import 'package:wbsapp/Data/data_repository/data_repository.dart';
import 'package:wbsapp/Data/data_repository/project_data.dart';
import 'package:wbsapp/Universal_Function/data_management.dart';
import 'package:wbsapp/Universal_Function/logger_management.dart';


class EditingModel {
  // Controllers
  final DataManagement dataManager = DataManagement();
  final LoggerManager logger = LoggerManager();
  final DataApplication dataApplication = DataApplication();

  // Controls changes are actually saved once not multiple times
  void changeEvaluator(String newProject, String newInputDes,
      Map<int, List<TextEditingController>> taskControllerList) {

    final Map<String, List<dynamic>> newDetailsTask = _taskInfoStore(
        taskControllerList);
    final bool _savableFlag = detectChanges(newProject,
        dataApplication.dataRepository);

    // Start saving
    if (_savableFlag) {
      final ProjectData projectData = ProjectData(newProject, newInputDes,
          newDetailsTask);
      dataManager.storeProject(projectData);
    }
    else {
      logger.d('Denied');
    }
  }

  // Evaluate a new input of the list whether changes are made
  bool detectChanges(String newInputList, List<ProjectData> model) {
    List<String> projectName = [];
    if (model != null && model.length != 0) {
      for (ProjectData project in model) {
        projectName.add(project.project);
      }
      logger.d('Detect Change Result: ${!projectName.contains(newInputList)}');
      // Compare a new project added with stored project
      return !projectName.contains(newInputList);
    }
    return true;
  }

  // Process TEC inputs for storing data
  Map<String, List<dynamic>> _taskInfoStore(
      Map<int, List<TextEditingController>> taskControllerList) {
    Map<String, List<dynamic>> _taskList = {};

    logger.i('test: Bug ===> ${taskControllerList.length}');
    // fetch inputs from controller list and passes onto Saving list
    taskControllerList.values.forEach((element) {
      _taskList[element[0].text] = [];

      // Current task inputs are less than 4, 4 indicates to iterate until 3
      for (int i = 1; i < 4; i++) {
        _taskList[element[0].text].add(element[i].text);
      }
    });
    return _taskList;
  }

  // Add new controllers for the task editing into Controller list
  Map<int, List<TextEditingController>> addTaskController(
      Map<int, List<TextEditingController>> taskControllers, int taskIndex) {
    try {
      // Controllers for task info
      /// 1st input: title
      /// 2nd input: description
      /// 3rd input: estimated time
      /// 4th input: due
      final List<TextEditingController> newControllers = [
        TextEditingController(), TextEditingController(),
        TextEditingController(), TextEditingController(),
      ];

      if (taskControllers.keys.length > taskIndex) {
        taskIndex = taskControllers.keys.length;
      }

      taskControllers[taskIndex] = newControllers;

      return taskControllers;
    } catch (e) {
      logger.e('Error: $e');
    }
  }

  // Increase the index of Controller List for the task entry channel
  int indexIncrement(int _currentControllerIndex) {
    // Increment the counter
    _currentControllerIndex++;
    return _currentControllerIndex;
  }
}
