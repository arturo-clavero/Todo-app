import 'package:hive_flutter/hive_flutter.dart';

class TodoData {
  List tasks = [
  ];

  var _myBox = Hive.box('mybox');

  void close() { _myBox.close();}
  void loadList() {
      if (_myBox.get("TODOLIST") == null)
      {
        tasks = [
        ["Task 1", false],
        ["task 2", false],
        ["task 3", false],
        ];
        updateList();
      }
      else {
        tasks = _myBox.get("TODOLIST");
      }
  }

  void updateList() {
     _myBox.put("TODOLIST", tasks);
  }
}