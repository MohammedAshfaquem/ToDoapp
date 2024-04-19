import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Tile extends StatelessWidget {
  Tile(
      {super.key,
      required this.text,
      required this.bools,
      required this.onchanged,
      required this.onchangeddelete});
  final String text;
  final dynamic bools;
  Function(bool?)? onchanged;
  Function()? onchangeddelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.yellow.shade500),
        height: 100,
        width: 500,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Checkbox(
              value: bools,
              onChanged: onchanged,
            ),
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            const SizedBox(
              width: 30,
            ),
            IconButton(
                onPressed: onchangeddelete, icon: const Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
