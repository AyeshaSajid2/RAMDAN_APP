import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nic_project/Screens/Home_Screen/Home_Screen.dart';
import 'package:nic_project/widgets/Colors.dart';


class SplashScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      color: primaryColor,
                      width: 500,
                      height: double.infinity,
                      child: Image.asset(
                        'assets/images/rail.png',
                        //fit: BoxFit.cover,
                      ),
                    ),),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    color: secondaryColor,
                    child: Column(
                      children: [
                        Positioned(
                          top: 50.0,
                          // left: 16.0,
                          // right: 16.0,
                          child: Text(
                            'Happy Ramadan Kareem',
                             style: GoogleFonts.abhayaLibre(
                            fontSize: 35,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        // Text on Bottom
                        Positioned(
                          top: 100.0,
                          left: 16.0,
                          right: 16.0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                            child: Text(
                              "Ramadan 2024, Hijri 1445 is expected to start "
                                  "from 10 March 2024 in the most of the countries",
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),

          ),
        ],
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 45.0),
        child: FractionallySizedBox(
          widthFactor: 0.75,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder)=>HomeScreen())
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              padding: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Explore",
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 16,
                     // fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center),
                Icon(Icons.arrow_forward),
              ],
            ),
          ),
        ),
      ),

    );
  }
}

