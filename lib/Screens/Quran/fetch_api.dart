// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:nic_project/Api_data/models/quran_api_model.dart';
// import 'package:nic_project/Api_data/services/quran_api_services.dart';
// import 'package:nic_project/Screens/Quran/surah_page.dart';
// import 'package:nic_project/Screens/todo_screens/recitation_popup.dart';
// import 'package:nic_project/Screens/todo_screens/recitation_target.dart';
// import 'package:nic_project/widgets/Colors.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class QuranApi extends StatefulWidget {
//   final int selectedNumber;
//
//   QuranApi({required this.selectedNumber});
//
//   @override
//   _QuranApiState createState() => _QuranApiState();
// }
//
// class _QuranApiState extends State<QuranApi> {
//   final QuranServices _quranService = QuranServices();
//
//   Quran? _quranData;
//   Map<String, double> _surahProgressMap = {};
//   late SharedPreferences _prefs;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadPreferences();
//     fetchData();
//   }
//
//   Future<void> _loadPreferences() async {
//     _prefs = await SharedPreferences.getInstance();
//   }
//
//   void fetchData() async {
//     try {
//       Quran quran = await _quranService.fetchQuranData();
//       print('API Response: $quran');
//       setState(() {
//         _quranData = quran;
//       });
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: secondaryColor,
//         appBar: AppBar(
//           title: Text('Quran Data'),
//           backgroundColor: primaryColor,
//           // actions: [
//           //   IconButton(
//           //     icon: Icon(Icons.table_rows_rounded),
//           //     onPressed: () {
//           //       Navigator.push(
//           //         context,
//           //         MaterialPageRoute(
//           //           builder: (context) => RecitationTarget(),
//           //         ),
//           //       );
//           //     },
//           //   ),
//           // ],
//         ),
//         body: _quranData != null
//             ? ListView.builder(
//           itemCount: _quranData!.data.surahs.length,
//           itemBuilder: (context, index) {
//             Surah surah = _quranData!.data.surahs[index];
//             double progress = _surahProgressMap[surah.name] ?? 0.0;
//
//             return Column(
//               children: [
//                 Container(
//                   margin: EdgeInsets.symmetric(
//                       horizontal: 20, vertical: 8),
//                   decoration: BoxDecoration(
//                     color: primaryColor,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: ListTile(
//                     title: Text(surah.name),
//                     titleTextStyle: GoogleFonts.notoNastaliqUrdu(
//                         fontSize: 26),
//                     titleAlignment:
//                     ListTileTitleAlignment.center,
//                     trailing: Text('${index + 1}'),
//                     leadingAndTrailingTextStyle: TextStyle(
//                       fontSize: 24,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     subtitle: Text(surah.englishName),
//                     onTap: () {
//                       _navigateToSurahPage(context, surah);
//                     },
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 20),
//                   decoration: BoxDecoration(
//                     color: primaryColor,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: LinearProgressIndicator(
//                     value: progress,
//                     backgroundColor: Colors.grey[300],
//                     valueColor: AlwaysStoppedAnimation<Color>(
//                       _getColorBasedOnPercentage(progress),
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           },
//         )
//             : Center(child: CircularProgressIndicator()),
//       ),
//     );
//   }
//
//   void _navigateToSurahPage(BuildContext context, Surah surah) async {
//     double percentage = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => SurahPage(
//           surah: surah,
//           selectedNumber: widget.selectedNumber,
//           onPercentageCalculated: (double percentage) {
//             setState(() {
//               _surahProgressMap[surah.name] = percentage / 100.0;
//               _saveColorPreference(surah.name, _getColorBasedOnPercentage(percentage / 100.0));
//             });
//           },
//         ),
//       ),
//     );
//   }
//
//   Color _getColorBasedOnPercentage(double percentage) {
//     if (percentage >= 0.75) {
//       return Colors.green;
//     } else if (percentage >= 0.5) {
//       return Colors.yellow;
//     } else if (percentage >= 0.25) {
//       return Colors.orange;
//     } else {
//       return Colors.red;
//     }
//   }
//
//   Future<void> _saveColorPreference(String surahName, Color color) async {
//     await _prefs.setInt(surahName, color.value);
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nic_project/Api_data/models/quran_api_model.dart';
import 'package:nic_project/Api_data/services/quran_api_services.dart';
import 'package:nic_project/Screens/Quran/surah_page.dart';
import 'package:nic_project/widgets/Colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranApi extends StatefulWidget {
  final int selectedNumber;

  QuranApi({required this.selectedNumber});

  @override
  _QuranApiState createState() => _QuranApiState();
}

class _QuranApiState extends State<QuranApi> {
  final QuranServices _quranService = QuranServices();

  Quran? _quranData;
  Map<String, double> _surahProgressMap = {};
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
    fetchData();
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void fetchData() async {
    try {
      Quran quran = await _quranService.fetchQuranData();
      print('API Response: $quran');
      setState(() {
        _quranData = quran;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: secondaryColor,
        appBar: AppBar(
          title: Text('Quran Data'),
          backgroundColor: primaryColor,
        ),
        body: _quranData != null
            ? ListView.builder(
          itemCount: _quranData!.data.surahs.length,
          itemBuilder: (context, index) {
            Surah surah = _quranData!.data.surahs[index];
            double progress = _surahProgressMap[surah.name] ?? 0.0;

            return Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    title: Text(surah.name),
                    titleTextStyle: GoogleFonts.notoNastaliqUrdu(
                        fontSize: 26),
                    titleAlignment:
                    ListTileTitleAlignment.center,
                    trailing: Text('${index + 1}'),
                    leadingAndTrailingTextStyle: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    subtitle: Text(surah.englishName),
                    onTap: () {
                      _navigateToSurahPage(context, surah);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(
                      _getColorBasedOnPercentage(progress),
                    ),
                  ),
                ),
              ],
            );
          },
        )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }

  void _navigateToSurahPage(BuildContext context, Surah surah) async {
    double percentage = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SurahPage(
          surah: surah,
          selectedNumber: widget.selectedNumber,
          onPercentageCalculated: (double percentage) {
            setState(() {
              _surahProgressMap[surah.name] = percentage / 100.0;
              _saveColorPreference(surah.name, _getColorBasedOnPercentage(percentage / 100.0));
            });
          },
        ),
      ),
    );
  }

  Color _getColorBasedOnPercentage(double percentage) {
    if (percentage >= 0.75) {
      return Colors.green;
    } else if (percentage >= 0.5) {
      return Colors.yellow;
    } else if (percentage >= 0.25) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  Future<void> _saveColorPreference(String surahName, Color color) async {
    await _prefs.setInt(surahName, color.value);
  }
}
