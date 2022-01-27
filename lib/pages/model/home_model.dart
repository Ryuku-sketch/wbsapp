import 'dart:math';

import 'package:wbsapp/Data/data_repository/project_data.dart';
import 'package:wbsapp/universal_function/logger_management.dart';

class HomeModel{
  final LoggerManager logger = LoggerManager();

  // Store project's toDay's task to list
  void toDayProjectDetector(ProjectData project,
      List<String> taskList,
      List<dynamic> taskDescList,
      List<String> projectName){
    project.taskWithDetail.forEach((task, values) {
      if(project.taskWithDetail[task][1] == '1' ||
          project.taskWithDetail[task][1] == '2'){

        taskList.add(task);
        taskDescList.add(values[0]);
        projectName.add(project.project);
      }
    });
    logger.d('Added Tasks: $taskList');
    logger.d('Added description: $taskDescList');
    logger.d('Added project name: $projectName');
  }

  double estimatedTimeProgress(ProjectData projectData){
    List<int> estimatedTime = [];
    double _currentProgress;
    projectData.taskWithDetail.values.forEach((element) {

      // ToDo: Add more logic to classify tasks done and not done
      if (element[1] != null && element[1].isNotEmpty){
        estimatedTime.add(int.parse(element[1]));
      }
    });

    // ToDo: use actual progress value
    // Debug: Use random value
    _currentProgress = (Random().nextDouble() * 100) /
        estimatedTime.reduce((a, b) => a + b);
    return _currentProgress;
  }

}