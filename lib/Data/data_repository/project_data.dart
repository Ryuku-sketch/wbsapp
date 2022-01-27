
import 'dart:core';


// Data Repository where it has the default value
class ProjectData{

  ProjectData(
    this.project,
    this.description,
    this.taskWithDetail
    );

  String project;
  String description;

  // Format: taskWidthDetail[Task] = {Description, EstimatedTime, Due}
  Map<String, List<dynamic>> taskWithDetail = {};


  // When decode from the json, automatically assign values to variables
  ProjectData.fromJson(Map<String, dynamic> json){
       project = json['project'];
        description = json['description'];
        taskWithDetail = json['taskWithDetail'];
  }



  // Specify a format in order to covert this object into json
  Map<String, dynamic> toJson(){
    return {
    'project':project,
    'description': description,
    'taskWithDetail': taskWithDetail,
    };

  }



  // Default List
  // List of Project with its description
  Map<String, dynamic> projectList = {'Name': 'Description'};
  // projectDetail = { projectList['A'].key :  ['task1', 'task2']};
  Map<String, List<dynamic>> projectDetail = {'Name': ['task1', 'task2']};
  // Components of Task Detail: This should be returned object where they have different values
  // 1. Description 2. Priority 3.Date  (4. Group Member)
  Map<String, List<dynamic>> taskComponents = {'Task1' : ['', 1, "1969-07-20 20:18:04Z"]};

}


// ToDO: Modify the data type
// Project and Description can be String
// Tasks can be List<String>
// TaskDetails can be Map<String, List<dynamic>>