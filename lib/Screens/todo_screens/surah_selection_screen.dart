import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nic_project/Screens/Quran/fetch_api.dart';
import 'package:nic_project/Screens/todo_screens/recitation_popup.dart';
import 'package:nic_project/Screens/todo_screens/recitation_target.dart';
import 'package:nic_project/widgets/Colors.dart';

class SelectNumOfSurah extends StatelessWidget {
  const SelectNumOfSurah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Recitation Target"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.calculate),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecitationTarget(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Select the number of ayah you want to recite today",
              style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberContainer(
                number: 5,
                context: context,
                controller: _controller,
              ),
              NumberContainer(
                number: 10,
                context: context,
                controller: _controller,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberContainer(
                number: 20,
                context: context,
                controller: _controller,
              ),
              NumberContainer(
                number: 40,
                context: context,
                controller: _controller,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            width: 200,
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                int? selectedNumber = int.tryParse(value);
                if (selectedNumber! > 0  ) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuranApi(selectedNumber: selectedNumber),
                    ),
                  );
                }
              },
              decoration: InputDecoration(
                labelText: 'Enter number of ayahs',
                labelStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class NumberContainer extends StatelessWidget {
  final int number;
  final BuildContext context;
  final TextEditingController controller;

  const NumberContainer({
    required this.number,
    required this.context,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        String inputNumber = controller.text;
        int selectedNumber = inputNumber.isNotEmpty ? int.parse(inputNumber) : number;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuranApi(selectedNumber: selectedNumber),
          ),
        );
      },
      child: Container(
        width: 130,
        height: 130,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.cyanAccent, primaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            '$number',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
