import 'package:flutter/material.dart';


class IconCards extends StatefulWidget {
  IconData myicon;
  String title;
  Widget Function() fn;

   IconCards({
    required this.title,
     required this.myicon,
     required this.fn

   });

  @override
  State<IconCards> createState() => _IconCardsState();
}

class _IconCardsState extends State<IconCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffe1b983),
        borderRadius: BorderRadius.circular(18)
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            IconButton(
              icon: Icon(widget.myicon),
              color: Colors.white,

              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder)=>widget.fn())
                );
              },
            ),
            Text("${widget.title}")
          ],
        ),
      ),
    );
  }
}
