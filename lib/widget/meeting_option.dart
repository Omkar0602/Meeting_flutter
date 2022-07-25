import 'package:flutter/material.dart';
import 'package:meetings_webster/util/colors.dart';

class MeetingOption extends StatelessWidget {
  const MeetingOption({Key? key, required this.text, required this.mute, required this.onChange}) : super(key: key);
final String text;
final  bool mute;
final Function(bool) onChange;
  @override
  Widget build(BuildContext context) {
      return Container(
        height: 60,
        color: secondaryBackgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
               
              padding: const EdgeInsets.all(8.0),
              child: Text(text,style: TextStyle(fontSize: 16),),
            ),
            Switch(value: mute  , onChanged: onChange)
          ],
        ),
      );
  }
}