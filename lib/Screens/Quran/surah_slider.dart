import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nic_project/Api_data/models/quran_api_model.dart';
import 'package:nic_project/widgets/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nic_project/Api_data/models/quran_api_model.dart';

class SurahSlider extends StatefulWidget {
  final List<Ayah> ayahs;
  final int initialAyahIndex;

  SurahSlider({required this.ayahs, required this.initialAyahIndex, required Null Function(dynamic index) onAyahChanged});

  @override
  _SurahSliderState createState() => _SurahSliderState();
}

class _SurahSliderState extends State<SurahSlider> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: BoxConstraints(maxWidth: 400),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    setState(() {
                      if (currentIndex > 0) {
                        currentIndex--;
                      }
                    });
                  },
                  color: Colors.white,
                ),
                Text(
                  'Ayah ${widget.ayahs[currentIndex].numberInSurah}',
                  // style: TextStyle(
                  //   fontWeight: FontWeight.bold,
                  //   fontSize: 18,
                  //   color: Colors.white,
                  //   fontFamily: GoogleFonts.amiri().fontFamily,
                  // ),
                    style: GoogleFonts.amiri(
                      color: Colors.black,
                      fontSize: 26,
                    )
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    setState(() {
                      if (currentIndex < widget.ayahs.length - 1) {
                        currentIndex++;
                      } else {
                        Navigator.of(context).pop(); // Close popup
                      }
                    });
                  },
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(height: 10),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  widget.ayahs[currentIndex].text,
                  style: GoogleFonts.amiri(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
