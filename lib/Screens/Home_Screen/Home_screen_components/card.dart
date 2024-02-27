import 'package:flutter/material.dart';
import 'package:nic_project/widgets/Colors.dart';

class MyCard extends StatefulWidget {
  String time;
  String title;
  
  MyCard({
    required this.time,
    required this.title
    
});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: primaryColor,
      child:  Container(
        // margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.wb_twilight, size: 30),
                SizedBox(width: 10),
                Switch(value: true, onChanged: (onChanged) {}),
              ],
            ),
            SizedBox(height: 5),
            Text(
              "${widget.time}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  "${widget.title} Time",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(width: 20),
                ImageIcon(
                  AssetImage("assets/images/icon2_iftar.png"),
                  size: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
