import 'package:flutter/material.dart';

class NewTask extends StatelessWidget{
  final String _description;
  final bool    _checked;
  final Function(bool?)?  onCheck;
  final bool    _editing;
  final VoidCallback  onEdit;
  final TextEditingController _myControler;
  final Function(String?)? onSubmit;
  final FocusNode _focus;

  const NewTask(
    this._description, 
    this._checked, 
    this.onCheck, 
    this._editing, 
    this.onEdit, 
    this._myControler, 
    this.onSubmit,
    this._focus,
    {super.key}
  );

  //method
  //ui
  @override
  Widget build(BuildContext context) {
    return Container(
            decoration:  BoxDecoration(
             color: Colors.yellow[400],
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(10),
            child: Row(
             //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                  value: _checked, 
                  onChanged: onCheck, 
                  shape: RoundedRectangleBorder(
                     side: BorderSide(color: Colors.black), // Outline color
                     borderRadius: BorderRadius.circular(4), // Square corners
                  ),
                 activeColor: const Color.fromARGB(255, 210, 196, 76),
                ),
                Expanded(child: _editing? TextField(
                                            controller: _myControler, 
                                            focusNode: _focus,
                                            cursorColor: Colors.black,
                                            onSubmitted: onSubmit,
                                            autofocus: true,
                                            )
                                          : Text(
                                            _description, 
                                            style: TextStyle(
                                                  fontSize: 20,
                                                 decoration : _checked 
                                                ? TextDecoration.lineThrough 
                                                : TextDecoration.none,
                        )
                         )),
                IconButton(
                  onPressed: onEdit, 
                  icon: _editing ? Icon(Icons.check) : Icon(Icons.edit))
              ]
           ),
          
    );
  }
}