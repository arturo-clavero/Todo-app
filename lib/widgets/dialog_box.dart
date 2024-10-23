import 'package:flutter/material.dart';
import 'icon_button.dart';

class DialogBox extends StatelessWidget{

  final void Function()? saveFt;
  final void Function()? cancelFt;
	final TextEditingController myController;

  const DialogBox({super.key, required this.saveFt, required this.cancelFt, required this.myController});

  void saveAnyways(String ?text)
  {
    saveFt!();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.yellow[400],
        content: SizedBox(
          height: 200,
          width: 200,
		  child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
			children :[
			TextField(
				controller: myController,
				showCursor: true,
				cursorColor: Colors.grey,
				autofocus: true,
        onSubmitted: saveAnyways,
				),
			Row(
				mainAxisAlignment: MainAxisAlignment.end,
				children: [
					MyIconButton(onPressed: saveFt, icon: Icon(Icons.save)),
					SizedBox(width:5),
          MyIconButton(onPressed: cancelFt, icon: Icon(Icons.delete)),
				],
			)
			]
		  )
        ),
    );
  }
}