import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String title;
  final void Function(bool?) checkboxCallback;
  final void Function() longPressCallback;

  const TaskTile({
    super.key,
    required this.isChecked,
    required this.title,
    required this.checkboxCallback,
    required this.longPressCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Remove Task?'),
            actions: [
              FilledButton.tonal(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: longPressCallback,
                child: const Text('Remove'),
              ),
            ],
          ),
        );
      },
      leading: Text(
        title,
        style: TextStyle(
          fontSize: 17,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
