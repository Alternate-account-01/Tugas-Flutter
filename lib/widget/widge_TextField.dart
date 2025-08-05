import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {

  final TextEditingController textEditingController;
  final String label;
  const MyTextField({super.key, required this.textEditingController, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(label: Text(label)),
      controller: textEditingController
    );
  }
}