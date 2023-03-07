import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GroupTile extends StatefulWidget {

  final String userName;
  final String groupId;
  final String groupName;

  const GroupTile({Key? key, required this.userName, required this.groupId, required this.groupName}) : super(key: key);

  @override
  State<GroupTile> createState() => _GroupTileState();
}

class _GroupTileState extends State<GroupTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          shape: BoxShape.circle
        ),
      ),
      title: Text(widget.groupName, style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
      subtitle: Text(widget.groupId, style: const TextStyle(color: Colors.white60),),
    );
  }
}
