// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:nic_project/Api_data/models/quran_api_model.dart';
// import 'package:nic_project/Api_data/services/quran_api_services.dart';
// import 'package:nic_project/Screens/todo_screens/target_popup.dart';
// import 'package:nic_project/Screens/todo_screens/target_progress.dart';
// import 'package:nic_project/widgets/Colors.dart';
//
// class RecitationTarget extends StatefulWidget {
//   RecitationTarget({Key? key}) : super(key: key);
//
//   @override
//   _RecitationTargetState createState() => _RecitationTargetState();
// }
//
// class _RecitationTargetState extends State<RecitationTarget> {
//   TextEditingController targetController = TextEditingController();
//   QuranServices _quranService = QuranServices();
//   Quran? _quranData;
//   int? targetDays;
//   int? ayahsPerDay;
//   double progressPercentage = 0.0;
//   late SharedPreferences prefs;
//
//   @override
//   void initState() {
//     super.initState();
//     initPrefs();
//   }
//
//   void initPrefs() async {
//     prefs = await SharedPreferences.getInstance();
//     double savedProgress = prefs.getDouble('progressPercentage') ?? 0.0;
//     setState(() {
//       progressPercentage = savedProgress;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: secondaryColor,
//       appBar: AppBar(
//         backgroundColor: primaryColor,
//         title: Text("Recitation Target"),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(Icons.close),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: targetController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 hintText: "Enter Number of days you want to complete Quran",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(40.0),
//                 ),
//                 filled: true,
//                 fillColor: Colors.grey,
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 calculateAyahsPerDay();
//               },
//               child: Text("Calculate", style: TextStyle(color: Colors.white),),
//               style: ButtonStyle(
//                 backgroundColor: MaterialStatePropertyAll(primaryColor),
//               ),
//             ),
//             SizedBox(height: 20),
//             if (ayahsPerDay != null)
//               Text(
//                   "You need to recite approximately $ayahsPerDay Ayahs per day"),
//             //
//             // SizedBox(height: 20),
//             // LinearProgressIndicator(
//             //   value: progressPercentage,
//             //   backgroundColor: primaryColor,
//             //   minHeight: 10,
//             //   valueColor: AlwaysStoppedAnimation<Color>(
//             //       progressPercentage > 0.0 ? Colors.green : primaryColor),
//             // ),
//             //
//             // SizedBox(height: 20),
//             // ElevatedButton(
//             //   onPressed: () {
//             //     Navigator.push(
//             //       context,
//             //       MaterialPageRoute(builder: (context) => TodoListScreen(
//             //         updateProgress: (value) {
//             //           setState(() {
//             //             progressPercentage = value;
//             //             prefs.setDouble('progressPercentage', value);
//             //           });
//             //         },
//             //       )),
//             //     );
//             // //   },
//             //   child: Row(
//             //     mainAxisAlignment: MainAxisAlignment.center,
//             //     children: [
//             //       Icon(Icons.flag),
//             //       SizedBox(width: 8),
//             //       Text("Goal", style: TextStyle(color: Colors.white),),
//             //     ],
//             // //   ),
//             //   style: ButtonStyle(
//             //     backgroundColor: MaterialStatePropertyAll(primaryColor),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void calculateAyahsPerDay() async {
//     if (targetController.text.isNotEmpty) {
//       targetDays = int.tryParse(targetController.text);
//       if (targetDays != null && targetDays! > 0) {
//         try {
//           _quranData = await _quranService.fetchQuranData();
//           int totalAyahs =
//               _quranData!.data.surahs.last.ayahs.last.numberInSurah;
//           ayahsPerDay = (6348 / targetDays!).ceil();
//           showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return TargetDialoge(
//                 message:
//                 "You need to recite approximately $ayahsPerDay Ayahs per day.",
//               );
//             },
//           );
//           setState(() {});
//         } catch (e) {
//           print("Error: $e");
//         }
//       }
//     }
//   }
//
//   @override
//   void dispose() {
//     targetController.dispose();
//     super.dispose();
//   }
// }
