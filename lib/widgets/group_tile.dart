import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GroupTile extends StatefulWidget {
  final String userName;
  final String groupId;
  final String groupName;

  const GroupTile(
      {Key? key,
      required this.userName,
      required this.groupId,
      required this.groupName})
      : super(key: key);

  @override
  State<GroupTile> createState() => _GroupTileState();
}

class _GroupTileState extends State<GroupTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.indigo[900],
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 23,
            spreadRadius: 2,
            color: Colors.black.withOpacity(0.25),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey.withOpacity(0.3),
          // decoration: BoxDecoration(
          //     color: Colors.grey.withOpacity(0.3), shape: BoxShape.circle),
        ),
        title: Text(
          widget.groupName,
          style: GoogleFonts.montserrat(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        subtitle: Text(
          'Join as ${widget.userName}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
