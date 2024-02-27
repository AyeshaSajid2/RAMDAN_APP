import 'package:flutter/material.dart';
import 'package:nic_project/Screens/todo_screens/target_popup.dart';
import 'package:nic_project/widgets/Colors.dart';

class RecitationTarget extends StatefulWidget {
  RecitationTarget({Key? key}) : super(key: key);

  @override
  _RecitationTargetState createState() => _RecitationTargetState();
}

class _RecitationTargetState extends State<RecitationTarget> {
  TextEditingController targetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        // color: primaryColor,
        // padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close),
                  ),
                ],
              ),
            ),
            Container(
               padding: const EdgeInsets.all(20.0),

              child: TextField(
                controller: targetController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter Number of days ",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
               padding: const EdgeInsets.all(20.0),

              child: ElevatedButton(
                onPressed: () {
                  calculateAyahsPerDay(context);
                },
                child: Text(
                  "Calculate",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calculateAyahsPerDay(BuildContext context) {
    if (targetController.text.isNotEmpty) {
      int? targetDays = int.tryParse(targetController.text);
      if (targetDays != null && targetDays > 0) {
        int ayahsPerDay = (6348 / targetDays).ceil();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return TargetDialoge(
              message: "You need to recite approximately $ayahsPerDay Ayahs per day.",
            );
          },
        );
      }
    }
  }

  @override
  void dispose() {
    targetController.dispose();
    super.dispose();
  }
}
