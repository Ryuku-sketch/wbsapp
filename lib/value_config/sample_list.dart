import 'package:wbsapp/Data/data_repository/project_data.dart';

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}


// copy from Official
// numberOfItems => number of iteration for creating the list
// Refactor this line of shit...
List<Item> generateItems(int numberOfItems) {
  final ProjectData projectData = ProjectData('test', 'test', {'Test': [1]});
  List<String> _projectList =[];
  List<String> _projectDescription = [];

  // return List of Item(predefined form(instance))
  return List<Item>.generate(numberOfItems, (int index) {
    projectData.projectList.forEach((key, value) {
      _projectList.add(key);
      _projectDescription.add(value);
    });
    return Item(
        headerValue:  _projectList[index],
        expandedValue: _projectDescription[index]
    );
  });
}

/// ToDO: Future features
/// 1: Adding Priority Parameter
/// 2: Get rid of spaces between the ExpansionPanel when you open it
/// 3: Put sample Sub_tasks withing the main tasks
/// 4: Make text as a button in order to increase the usability of the app