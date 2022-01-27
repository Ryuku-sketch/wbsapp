
import 'package:logger/logger.dart';


// Basic function of LoggerManger is the same as Logger
// Later, maybe after adding flavor, it will expand the coverage of feature
// i.e Log Controls based on flavors or something like that
class LoggerManager extends Logger {

  // Singleton Structure to keep cache usage limited

  static final LoggerManager _instance = LoggerManager._internal();
  factory LoggerManager(){
    return _instance;
  }
  LoggerManager._internal();



  
}