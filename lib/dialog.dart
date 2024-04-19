import 'package:flutter/material.dart';

class Diolaog extends StatefulWidget {
  const Diolaog({super.key, this.controller});
  // ignore: prefer_typing_uninitialized_variables
  final controller;

  @override
  State<Diolaog> createState() => _DiolaogState();
}

class _DiolaogState extends State<Diolaog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const TextField(),
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text("Done"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
      ],
    );
  }
}
