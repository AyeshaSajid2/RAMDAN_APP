import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nic_project/Api_data/models/quran_api_model.dart';
import 'package:nic_project/widgets/Colors.dart';
import 'package:nic_project/Screens/Quran/surah_slider.dart';

class SurahPage extends StatefulWidget {
  final Surah surah;
  final int selectedNumber;
  final void Function(double) onPercentageCalculated;

  const SurahPage({
    required this.surah,
    required this.selectedNumber,
    required this.onPercentageCalculated,
  });

  @override
  _SurahPageState createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  late List<bool> checkedAyahs;
  late SharedPreferences prefs;
  bool surahCompleted = false;
  Color barColor = primaryColor;

  @override
  void initState() {
    super.initState();
    initPrefs();
    checkedAyahs = List<bool>.filled(widget.surah.ayahs.length, false);
  }

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    _loadBarColor();
    _loadClickedAyahs();
  }

  void _loadBarColor() {
    final int? storedColor = prefs.getInt('${widget.surah.name}_color');
    if (storedColor != null) {
      setState(() {
        barColor = Color(storedColor);
      });
    }
  }

  void _loadClickedAyahs() {
    final List<int>? clickedIndexes = prefs.getStringList('${widget.surah.name}_ayahs')?.map((e) => int.parse(e)).toList();
    if (clickedIndexes != null) {
      setState(() {
        for (int index in clickedIndexes) {
          checkedAyahs[index] = true;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        title: Text(
          widget.surah.name,
          // backgroundColor: clickedAyahsIndexes.length == widget.selectedNumber ? Colors.green : primaryColor,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.surah.ayahs.length,
              itemBuilder: (context, index) {
                Ayah ayah = widget.surah.ayahs[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      checkedAyahs[index] = !checkedAyahs[index];
                      double percentage = _calculatePercentage(checkedAyahs);
                      widget.onPercentageCalculated(percentage);
                      _storeClicks();
                    });
                  },
                  onDoubleTap: () {
                    _showSurahSlider(context, index);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 15),
                    decoration: BoxDecoration(
                      color: checkedAyahs[index] ? primaryColor2 : Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      title: Text('Ayah ${ayah.numberInSurah}'),
                      titleTextStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      subtitleTextStyle: GoogleFonts.notoNastaliqUrdu(fontSize: 26),
                      subtitle: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          ayah.text,
                          style: GoogleFonts.amiri(
                            color: Colors.black,
                            fontSize: 26,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK', style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding: EdgeInsets.symmetric(vertical: 16), // Adjust padding as needed
              ),

            ),
          ),

        ],
      ),
    );
  }

  void _showSurahSlider(BuildContext context, int initialAyahIndex) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SurahSlider(
          ayahs: widget.surah.ayahs,
          initialAyahIndex: initialAyahIndex,
          onAyahChanged: (index) {
            setState(() {
              checkedAyahs[index] = true;
              double percentage = _calculatePercentage(checkedAyahs);
              widget.onPercentageCalculated(percentage);
              _storeClicks();
            });
          },
        );
      },
    );
  }

  double _calculatePercentage(List<bool> checkedList) {
    int total = checkedList.length;
    int checkedCount = checkedList.where((element) => element).length;
    return (checkedCount / total) * 100.0;
  }

  void _storeClicks() {
    List<int> clickedAyahsIndexes = [];
    for (int i = 0; i < checkedAyahs.length; i++) {
      if (checkedAyahs[i]) {
        clickedAyahsIndexes.add(i);
      }
    }
    prefs.setStringList('${widget.surah.name}_ayahs', clickedAyahsIndexes.map((e) => e.toString()).toList());
    prefs.setInt(widget.surah.name + '_color', barColor.value); // Store the color value

    // Check if the number of clicked ayahs equals selectedNumber
    if (clickedAyahsIndexes.length == widget.selectedNumber) {
      _showSnackbar();
    }
  }

  void _showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Congratulations! You recited ${widget.selectedNumber} ayahs and completed today's target."),
      ),
    );
  }
}
