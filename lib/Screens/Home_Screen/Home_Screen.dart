import 'package:flutter/material.dart';
// import 'package:nic_project/Screens/Allah_name/screen/Allah_name_screen.dart';
import 'package:nic_project/Screens/Allah_name/screen/name_screen.dart';
import 'package:nic_project/Screens/Home_Screen/Home_screen_components/DailySupplication.dart';
// import 'package:nic_project/Screens/Quran/fetch_api.dart';
import 'package:nic_project/Screens/todo_screens/surah_selection_screen.dart';
import 'package:nic_project/footer.dart';
import 'package:nic_project/widgets/Colors.dart';
import 'Home_screen_components/card.dart';
import 'Home_screen_components/greetings.dart';
import 'Home_screen_components/icon_cards.dart';
import 'Home_screen_components/prayer_timings.dart';
import 'Home_screen_components/top_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
// NotificationServices notificationServices= NotificationServices();


  // void initState(){
  //   super.initState();
  //   notificationServices.requestNotificationPermission();
  //   notificationServices.getDeviceToken().then((value){
  //     print("Device token : ${value}");
  //   }
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
         child: Padding(
           padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                greetings(),
                SizedBox(height: 10),
                myTopBar(),
                SizedBox(height: 10),
                Row(
                  children: [
                    Column(
                      children: [
                        MyCard(time: "4:00 am", title: "Sehar"),
                        MyCard(time: "7:00 pm", title: "Iftar")
                      ],
                    ),
                   SizedBox(width: 15,),
                   Container(
                     color: primaryColor,
                     child: Column(
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Icon(Icons.wb_twilight, size: 30),
                             SizedBox(width: 30),
                             Switch(value: true, onChanged: (onChanged) {}),
                           ],
                         ),
                         Text(
                           "Daily Remainders",
                           style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 18
                           ),
                         ),
                         PrayerTimes()
                       ],
                     ),
                   )
                   // PrayerTimes()
                  ],
                ),
                SizedBox(height: 10,),

                DailyDuasCard(
                  duaTitle: 'Dua for a Blessed Day',
                  duaText: 'O Allah, bless this day and guide me in my actions.',
                ),
                SizedBox(height: 10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    IconCards(
                      myicon: Icons.timer_outlined,
                      title: "Prayer Time",
                      fn: () => PrayerTimesPage(),
                    ),

                    IconCards(
                      myicon: Icons.my_library_books_outlined,
                      title: "Al Quran",
                      fn: () => SelectNumOfSurah(),
                    ),

                    IconCards(
                      myicon: Icons.mosque,
                      title: "Daily Duas",
                      fn: () => NameScreen(),
                    ),
                  ],
                ),


              ],
            ),
          ),
      ),
      ),
      persistentFooterButtons: [
        myFooter()
      ],
    );
  }

  PrayerTimesPage() {

  }

}
