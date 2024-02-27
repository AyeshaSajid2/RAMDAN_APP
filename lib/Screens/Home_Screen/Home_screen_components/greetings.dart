import 'package:flutter/material.dart';
import 'package:nic_project/widgets/Colors.dart';

class greetings extends StatefulWidget {
  const greetings({super.key});

  @override
  State<greetings> createState() => _greetingsState();
}

class _greetingsState extends State<greetings> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Ramadan Kareem",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        CircleAvatar(
          backgroundColor: primaryColor,
          radius: 24,
          child: Icon(
            Icons.mosque,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
