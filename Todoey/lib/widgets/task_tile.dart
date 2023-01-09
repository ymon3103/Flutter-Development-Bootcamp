import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    this.isChecked = false,
    required this.taskTitle,
    required this.checkboxCallback,
    required this.longPressCallback,
    super.key,
  });

  final bool isChecked;
  final String taskTitle;
  final void Function(bool?)? checkboxCallback;
  final void Function()? longPressCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
