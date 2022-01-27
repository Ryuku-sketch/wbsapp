import 'package:flutter/material.dart';

///
/// Define all the values for the layout parameters
///
abstract class Res{}

extension buttonlayout on Res{
  static const double buttonheight = 72.0;
  static const double buttonwidth = 300.0;
  // button padding layout
  static const double buttonpad = 10.0;
}

extension paddingconfig on Res{
  static const double hometop = 55.0;
  static const double homemiddle = 25.0;
}
extension WbsPage on Res{
  // Width
  static const double tasksWidth = 250;
  static const double tasksHeight = 70;
  // Padding
  static const double padTitle =25.0;
  static const double padBottom = 25.0;

  static const double padList = 25.0;

  // Font
  static const double fontTitle = 50.0;
  static const double fontBottom = 20.0;
}

extension ColorConfig on Res{
  static Color bottomBarColor = Colors.cyan[100];
  static Color bottomBarSelected = Colors.lightGreen[600];
  static Color primaryBackground = Colors.white30;
  static Color primaryWidgetColor = Colors.white70;
  static Color customBorderColor = Colors.black12;
  static Color debugColor = Colors.red;
  static Color swipeTaskColor = Colors.white;
  // Color for the container when the task is swiped
  static Color completeColor  = Colors.blueAccent;
  static Color editSwipeColor = Colors.green;
  static Color progressPercentageColor = Colors.blue;
}

extension LocalVariable on Res{
  static int pageIndex =0 ;
}

extension appBarItem on Res{
  // Icon
  static const Icon searchIcon = Icon(
    Icons.search_rounded,
    color: Colors.black26,
  );
  static const Icon configIcon =  Icon(
    Icons.settings,
    color: Colors.black26,
  );

}

extension bottomBar on Res{
  static const Icon bottomHome = Icon(Icons.home);
  static const Icon bottomProjects = Icon(Icons.auto_fix_high);
  static const Icon bottomEdit = Icon(Icons.android_outlined);
  static const String homeLabel = 'Home';
  static const String projectLabel = 'All Projects';
  static const String editLabel = 'Edit';

}

extension homePage on Res{
  // Width
  static const double projectCardWidth = 280;
  static const double progressBarWidth = 195;
  static const double todayWidth = 375;

  // Height
  static const double projectCardHeight = 180;
  static const double todayHeight = 600;
  static const double noTaskHeight = 170;

  // Padding
  static const EdgeInsets dismissedTextPadding = EdgeInsets.all(10.0);
  static const EdgeInsets todayTitlePadding = EdgeInsets.only(bottom: 10.0,
      top: 10.0);
  static const EdgeInsets titleProgressBarPadding = EdgeInsets.all(30);
  static const EdgeInsets projectCardSidePadding = EdgeInsets.only(
      left:10, right: 10);
  static const EdgeInsets progressBarMeasurePadding = EdgeInsets.only(
      bottom: 2, right: 18);
  static const EdgeInsets homePageAdjustPadding = EdgeInsets.all(20.0);
  static const EdgeInsets littleAdjustPadding = EdgeInsets.all(13.0);
  static const EdgeInsets noneTaskPadding  = EdgeInsets.only(top:30.0,
      bottom: 30.0);

  // Text
  static const String completionText = 'Complete!';
  static const String editingText = 'Edit';

}


extension editPage on Res{
  // Width: Container
  static const double titleWidth = 400;
  static const double editBoxWidth = 450;
  static const double subtitleWidth = 300;
  static const double textBoxWidth = 300;
  static const double dividerWidth = 325;
  static const double savingWidth = 100;
  static const double customBoxWidth = 126;

  // Height: Container
  static const double editBoxSubtitleHeight = 23;
  static const double savingHeight = 50;

  // FontSize
  static const double titleFontSize = 25;
  static const double semiTitleFontSize = 15;
  static const double saveFontSize = 20.0;

  // Padding
  static const EdgeInsets pageTopBottomMargin
    = EdgeInsets.only(top:25, bottom: 25);
  static const EdgeInsets titleLeftMargin = EdgeInsets.only(left: 25);
  static const EdgeInsets adjustedMargin = EdgeInsets.all(10.0);
  static const EdgeInsets adjustedMargin2 = EdgeInsets.all(25);
  static const EdgeInsets subtitleLeftMargin = EdgeInsets.only(left: 25);
  static const EdgeInsets editBoxBottomMargin = EdgeInsets.all(12.0);
  static const EdgeInsets decorationSurroundedMargin
    = EdgeInsets.only(left:20, right: 20, bottom: 7);

  // Icon
  static const Icon addIcon = Icon(Icons.add);
  static const Icon removeIcon = Icon(Icons.remove);

  // Text
  static const String addText = 'Add a new task';
  static const String removeText = 'Remove the added task';
  static const String subtitleProject = 'Project Title';
  static const String subtitleDescription = 'Description';
  static const String subtitleTask = 'Task';
  static const String subtitleDetail = 'Detail';
  static const String subtitleEstimation = 'Estimation (h)';
  static const String subtitleDue = 'Due';


}

extension dividerWidget on Res{
  static const double dividerEditWidth = 325;
  //Not Fixed
  static const double dividerHomeWidth = 400;
}

extension workPage on Res{
  // fontSize
  static const double titleSize = 100;
}
