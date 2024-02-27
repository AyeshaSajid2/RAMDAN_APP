import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nic_project/widgets/Colors.dart';

class TodoListScreen extends StatefulWidget {
  final Function(double)? updateProgress;

  TodoListScreen({Key? key, this.updateProgress}) : super(key: key);

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  late List<TodoItem> todos;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      todos = [
        TodoItem(
            title: 'Fajar',
            completed: prefs.getBool('Fajar') ?? false,
            lastChecked: prefs.getInt('Fajar_lastChecked') ?? 0),
        TodoItem(
            title: 'Zuhr',
            completed: prefs.getBool('Zuhr') ?? false,
            lastChecked: prefs.getInt('Zuhr_lastChecked') ?? 0),
        TodoItem(
            title: 'Asar',
            completed: prefs.getBool('Asar') ?? false,
            lastChecked: prefs.getInt('Asar_lastChecked') ?? 0),
        TodoItem(
            title: 'Maghrib',
            completed: prefs.getBool('Maghrib') ?? false,
            lastChecked: prefs.getInt('Maghrib_lastChecked') ?? 0),
        TodoItem(
            title: 'Esha',
            completed: prefs.getBool('Esha') ?? false,
            lastChecked: prefs.getInt('Esha_lastChecked') ?? 0),
        TodoItem(
            title: 'Recitation',
            completed: prefs.getBool('Recitation') ?? false,
            lastChecked: prefs.getInt('Recitation_lastChecked') ?? 0),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        title: Text("Today's Target"),
        backgroundColor: primaryColor,
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: TodoListItem(
              todo: todos[index],
              onCheckboxChanged: (value) {
                setState(() {
                  todos[index].completed = value!;
                  todos[index].lastChecked = DateTime.now().millisecondsSinceEpoch;
                  prefs.setBool(todos[index].title, value);
                  prefs.setInt(todos[index].title + '_lastChecked', todos[index].lastChecked);
                  updateProgress();
                });
              },
            ),
          );
        },
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('OK', style: TextStyle(color: Colors.white),),
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(primaryColor),
        ),
      ),
    );
  }

  void updateProgress() {
    int completedCount = todos.where((item) => item.completed).length;
    double progress = completedCount / todos.length;
    widget.updateProgress?.call(progress);
  }
}

class TodoItem {
  final String title;
  bool completed;
  int lastChecked;

  TodoItem({required this.title, required this.completed, required this.lastChecked});
}

class TodoListItem extends StatelessWidget {
  final TodoItem todo;
  final ValueChanged<bool?>? onCheckboxChanged;

  TodoListItem({required this.todo, this.onCheckboxChanged});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: todo.completed ? primaryColor2 : Colors.grey,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  todo.title,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: todo.completed ? Colors.white : Colors.black,
                  ),
                ),
              ),
              SizedBox(width: 8.0),
              Transform.scale(
                scale: 1.5,
                child: Checkbox(
                  value: todo.completed,
                  onChanged: onCheckboxChanged,
                  activeColor: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
