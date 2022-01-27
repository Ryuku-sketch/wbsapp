import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wbsapp/Data/data_repository/data_repository.dart';
import 'package:wbsapp/Data/data_repository/project_data.dart';
import 'package:wbsapp/Universal_Function/logger_management.dart';

/// task: Projects
/// description: Projects description

// model: modifying data
class DataManagement {
  // Instantiate SharedPreference
  static final DataManagement _instance = DataManagement._internal();

  factory DataManagement(){
    return _instance;
  }

  DataManagement._internal();

  static SharedPreferences _getInfo;
  final LoggerManager logger = LoggerManager();
  final DataApplication dataApplication = DataApplication();


  // initialize the instances
  static Future<SharedPreferences> initialize() async {
    _getInfo = await SharedPreferences.getInstance();
    return _getInfo;
  }

  // Save the task data to local storage
  void storeProject(ProjectData task) async {
    // insert a new data to synchronize the operation with presentation layer
    dataApplication.dataRepository.add(task);

    // save the data for the later use
    String _value = jsonEncode(task);
    dataApplication.saveRepository.add(_value);
    _getInfo.setStringList('ProjectList', dataApplication.saveRepository);
    logger.i('Task Saved');
    logger.i('added/ ${dataApplication.saveRepository.last}');
  }

  Future<void> loadProject() async {
    try{
      final _value = _getInfo.getStringList('ProjectList');

      if(_value == null){
        return dataApplication.dataRepository;
      } else {
        _value.forEach((element) {
          Map<String, dynamic> json = jsonDecode(element);
          ProjectData projectData = ProjectData.fromJson(json);

          // make a synchronization of data
          // add both repositories to match all project data for later storing task
          dataApplication.saveRepository.add(element);
          dataApplication.dataRepository.add(projectData);
        });
        logger.i('Task Loaded/ ${dataApplication.dataRepository} '
            'with length of ${dataApplication.dataRepository.length}');
      }
    } catch(e){
     logger.e('This is an error: $e');
    }

  }

}