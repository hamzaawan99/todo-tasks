import 'package:flutter/material.dart';

class RemindersList extends StatefulWidget {
  RemindersList({ Key? key }) : super(key: key);
  @override
  _RemindersListState createState() => _RemindersListState();
}

class _RemindersListState extends State<RemindersList> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Reminders List"),);
  }
}