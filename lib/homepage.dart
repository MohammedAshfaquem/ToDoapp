import 'package:flutter/material.dart';
import 'package:flutter_application_1/To_do_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final controller = TextEditingController();
  List todolist = [
    ["Do any", false],
    ["did any", false],
    ["did any", false],
  ];
  void trueorfalse(bool? value, int index) {
    setState(() {
      todolist[index][1] = !todolist[index][1];
    });
  }

  void newtask() {
    showDialog(
      context: context,
      builder: (context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: AlertDialog(
          backgroundColor: Colors.yellowAccent,
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
                hintText: "Add your work",
                border: OutlineInputBorder(borderSide: BorderSide())),
          ),
          actions: [
            TextButton(
              onPressed: () {
                return addtile();
              },
              child: const Text("Done"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
          ],
        ),
      ),
    );
  }

  void addtile() {
    setState(() {
      todolist.add([controller.text, false]);
      Navigator.of(context).pop();
    });
  }

  void deletetile(int index) {
    setState(() {
      todolist.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow.shade400,
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade600,
          centerTitle: true,
          title: const Text(
            "TO DO APP",
            style: TextStyle(letterSpacing: 5),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            return newtask();
          },
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: todolist.length,
          itemBuilder: (context, index) {
            return Tile(
              text: todolist[index][0],
              bools: todolist[index][1],
              onchanged: (value) {
                return trueorfalse(value, index);
              },
              onchangeddelete: () {
                return deletetile(index);
              },
            );
          },
        ));
  }
}
