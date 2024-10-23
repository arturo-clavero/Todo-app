import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget
{
  final void Function()? onPressed;
  final Widget icon;
  
  const MyIconButton({super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      );
  }
}