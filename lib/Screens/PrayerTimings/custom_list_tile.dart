import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String trailing;
  final Color tileColor;

  const CustomListTile({
    required this.title,
    required this.trailing,
    required this.tileColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: tileColor, // Customized background color
        ),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(color: Colors.white), // Customized text color
          ),
          trailing: Text(
            trailing,
            style: TextStyle(color: Colors.white), // Customized text color
          ),
        ),
      ),
    );
  }
}
