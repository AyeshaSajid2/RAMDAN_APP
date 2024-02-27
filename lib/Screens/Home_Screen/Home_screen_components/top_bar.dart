import 'package:flutter/material.dart';
import 'package:nic_project/widgets/Colors.dart';


class myTopBar extends StatefulWidget {
  const myTopBar({super.key});

  @override
  State<myTopBar> createState() => _myTopBarState();
}

class _myTopBarState extends State<myTopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "Iftar",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Remaining Activity",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Switch(value: true, onChanged: (onChanged) {}),
              SizedBox(height: 5),
              Text(
                "30 min",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
