import 'dart:math';

import 'package:flutter/material.dart';

class myFooter extends StatefulWidget {
  const myFooter({super.key});

  @override
  State<myFooter> createState() => _myFooterState();
}

class _myFooterState extends State<myFooter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.home),
        ),
        FloatingActionButton(
          onPressed: () {
            // Add your onPressed functionality here
          },
          child: Icon(Icons.my_library_books_outlined),
        ),

        FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.notifications_active),
        ),

        FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.mosque_sharp),
        ),
        FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.person),
        ),
      ],
    );
  }
}
