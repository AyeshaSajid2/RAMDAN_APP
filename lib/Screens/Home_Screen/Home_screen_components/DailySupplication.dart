import 'package:flutter/material.dart';
import 'package:nic_project/widgets/Colors.dart';


class DailyDuasCard extends StatelessWidget {
  final String duaTitle;
  final String duaText;

  DailyDuasCard({
    required this.duaTitle,
    required this.duaText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      // margin: EdgeInsets.all(5),
      color: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   'Dua of the Day',
            //   style: TextStyle(
            //     fontSize: 18,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // SizedBox(height: 10),
            Text(
              duaTitle,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              duaText,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
