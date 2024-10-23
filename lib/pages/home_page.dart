import 'package:flutter/material.dart';
import '../widgets/new_task.dart';
import '../widgets/dialog_box.dart';
import '../widgets/slidable.dart';
import '../database/todo_data.dart';

part 'home_page_methods.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
	final TextEditingController boxController = TextEditingController();
  TodoData db = TodoData();
  List rtTaskInfo = [];

  @override
  void initState()
  {
    db.loadList();
    super.initState();
    //init real time task info 
    for (int i = 0; i < db.tasks.length; i++)
    {
      rtTaskInfo.add([false, TextEditingController(), FocusNode()]);
    }
    //listener to focus of edit to save if change focus
    for (int i = 0; i < db.tasks.length; i++)
    {
      rtTaskInfo[i][2].addListener(() {
        if (!rtTaskInfo[i][2].hasFocus && rtTaskInfo[i][0]) {
          onEdit(i);
        } 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(title: Text("TO DO"), centerTitle: true, elevation: 0,),
      body: 
      ListView.builder(
        itemCount: db.tasks.length,
        itemBuilder:(context, index)=> 
         DragSlider(
            deleteFt: (context)=>deleteTask(index),
            componentWhenNotDragged: 
                  NewTask(
                  db.tasks[index][0], 
                  db.tasks[index][1], 
                  (value) => onChanged(value, index), 
                  rtTaskInfo[index][0], 
                  ()=>onEdit(index),
                  rtTaskInfo[index][1],
                  (input)=> onSubmit(input, index),
                  rtTaskInfo[index][2],
            ),
            ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: addTask, child: Icon(Icons.add)),
    );
  }

  @override
void dispose() {
  db.close(); // Close the box when the app is disposed
  super.dispose();
}
}