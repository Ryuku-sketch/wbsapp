import 'package:flutter/material.dart';
import 'package:wbsapp/Data/data_repository/data_repository.dart';
import 'package:wbsapp/Universal_Function/data_management.dart';
import 'package:wbsapp/Universal_Function/logger_management.dart';
import 'package:wbsapp/pages/View/editing_page.dart';
import 'package:wbsapp/pages/View/home_page.dart';
import 'package:wbsapp/pages/View/wbs_view.dart';
import 'package:wbsapp/pages/view_model/home_view_model.dart';
import 'package:wbsapp/value_config/PageRoute.dart';
import 'package:wbsapp/value_config/layout_config.dart';

import 'Basic_Page_Widget/appbar_widget.dart';

class BottomBarView extends StatefulWidget {
  BottomBarView({Key key}) : super(key: key);
  _BottomBarView createState() => _BottomBarView();}

class _BottomBarView extends State<BottomBarView> {
  // Util Controllers
  final DataManagement dataManager = DataManagement();
  final LoggerManager logger = LoggerManager();
  final DataApplication dataApplication = DataApplication();

  final List<Widget> pageList = [WorkPage(), WBSView(), EditingPage()];


  @override
  void initState() {
    setState(() {
      dataLoading();
    });
  }

  @override
  void dispose(){

  }

  // Loading data.
  Future<void> dataLoading() async {
    dataApplication.initialize();
    await dataManager.loadProject();
  }

  void bottomPageNavigator(int index){
    setState(() {
      bottomIndex.pageIndex = index;
      logger.d(bottomIndex.pageIndex);

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(),
      body: pageList[bottomIndex.pageIndex],
      bottomNavigationBar:  BottomNavigationBar(
          backgroundColor: ColorConfig.bottomBarColor,
          selectedItemColor: ColorConfig.bottomBarSelected,
          // Fixed: Allow to put more than 3 icons
          type : BottomNavigationBarType.fixed,
          currentIndex: bottomIndex.pageIndex,
          onTap:(_index){bottomPageNavigator(_index);},
          items:[
            BottomNavigationBarItem(
                icon: bottomBar.bottomHome,
                label: bottomBar.homeLabel),
            BottomNavigationBarItem(
                icon: bottomBar.bottomProjects,
                label: bottomBar.projectLabel),
            BottomNavigationBarItem(
                icon: bottomBar.bottomEdit,
                label: bottomBar.editLabel),
          ]
      ) ,
    );
  }
}