import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DragSlider extends StatelessWidget
{
  final Widget componentWhenNotDragged;
  final Function(BuildContext)? deleteFt;
  const DragSlider({super.key, required this.componentWhenNotDragged, required this.deleteFt});

  void doNothing(BuildContext context){}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Slidable(
        key: const ValueKey(0),
        endActionPane:  ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFt,
              backgroundColor: const Color.fromARGB(255, 183, 50, 41),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
             borderRadius: BorderRadius.circular(10),
            ),
          ],
        ),
        child: componentWhenNotDragged,
        ),
    );
  }
}