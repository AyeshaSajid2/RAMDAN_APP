import 'package:flutter/material.dart';
import 'package:nic_project/widgets/Colors.dart';

class TargetDialoge extends StatelessWidget {
  final String? message;

  const TargetDialoge({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(message ?? ''),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
          ),
          child: const Text("OK"),
        ),
      ],
    );
  }
}
