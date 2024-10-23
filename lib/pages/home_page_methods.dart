part of 'home_page.dart';

extension _Methods on _HomePageState
{
	void onChanged(bool? value, int index)
	{
    	// ignore: invalid_use_of_protected_member
    setState(() {
        db.tasks[index][1] = !db.tasks[index][1];
    });
		db.updateList();
  }

	void onEdit(int index)
	{
		// ignore: invalid_use_of_protected_member
		setState((){
			rtTaskInfo[index][0] = !rtTaskInfo[index][0];
		});
		if (!rtTaskInfo[index][0]) //if is done editing
		{
			if (RegExp(r'^[ \t]*$').hasMatch(rtTaskInfo[index][1].text))
			{
				deleteTask(index);
			}
      else
      {
			  db.tasks[index][0] = rtTaskInfo[index][1].text;
        db.updateList();
      }
		}
		else
		{
			rtTaskInfo[index][2].requestFocus();
			rtTaskInfo[index][1].text = db.tasks[index][0];
		}
	}

	void onSubmit(String? input, int index)
	{
		onEdit(index);
	}

	void save()
	{
		// ignore: invalid_use_of_protected_member
		setState(() {
			if (!RegExp(r'^[ \t]*$').hasMatch(boxController.text)) {
			  db.tasks.add([boxController.text, false]);
        rtTaskInfo.add([false, TextEditingController(), FocusNode()]);
        db.updateList();
      }
		//else write message empty //TODO!
		});
		cancel();
	}

	void	cancel()
	{
		boxController.text = "";
		Navigator.of(context).pop();
	}

	void addTask()
	{
		showDialog(
			context: context, 
			builder: (context) => DialogBox(saveFt: save, cancelFt: cancel, myController: boxController));
	}

	void deleteTask(int index)
	{
    print("in delete\n\n\n");
		// ignore: invalid_use_of_protected_member
		setState(() {
			db.tasks.removeAt(index);
		});
    rtTaskInfo.removeAt(index);
		db.updateList();
	}
}