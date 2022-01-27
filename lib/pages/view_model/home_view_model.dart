import 'package:wbsapp/Data/data_repository/project_data.dart';
import 'package:wbsapp/pages/model/home_model.dart';
import 'package:wbsapp/universal_function/logger_management.dart';

class HomeViewModel{
  final HomeModel model = HomeModel();
  final LoggerManager logger = LoggerManager();
  List<String> taskList =[];
  List<dynamic> taskDescList = [];
  List<String> projectName = [];
  List<double> progressValues = [];

  void todayTaskList(ProjectData project){
    model.toDayProjectDetector(project,taskList, taskDescList, projectName);
  }

  void progressCalculation(ProjectData project) {
    progressValues.add(model.estimatedTimeProgress(project));
  }
}