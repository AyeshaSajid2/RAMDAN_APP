import 'dart:math';

import 'package:flutter/material.dart';


class PrayerTimes extends StatefulWidget {
  const PrayerTimes({super.key});

  @override
  State<PrayerTimes> createState() => _PrayerTimesState();
}

class _PrayerTimesState extends State<PrayerTimes> {
  @override
  Widget build(BuildContext context) {
    return Container(

      color: Color(0xffd7b889),
      width: max(100, 200),
       height: max(100, 200),
      child: Column(
        children: [

          Text("Fajar"),
          Text("Fajar"),
          Text("Fajar"),
          Text("Fajar"),
          Text("Fajar"),
          Text("Fajar"),

          // ListTile(
          //   title: Text("Prayer Times"),
          // ),
          // ListTile(
          //   title: Text("Fajar"),
          //   trailing: Text("4:00 am"),
          // ),
          // ListTile(
          //   title: Text("Sunrise"),
          //   trailing: Text("4:00 am"),
          // ),
          // ListTile(
          //   title: Text("Duhur"),
          //   trailing: Text("4:00 am"),
          // ),
          // ListTile(
          //   title: Text("Asar"),
          //   trailing: Text("4:00 am"),
          // ),
          // ListTile(
          //   title: Text("Maghrib"),
          //   trailing: Text("4:00 am"),
          // ),
          // ListTile(
          //   title: Text("Isha"),
          //   trailing: Text("4:00 am"),
          // ),
        ],
      ),
    );
  }
}
