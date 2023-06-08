import 'package:flutter/material.dart';

import '../../../models/club.dart';
import '../club_detail/club_detail_view.dart';

class ClubListItem extends StatefulWidget {
  final Club club;

  const ClubListItem({Key? key, required this.club}) : super(key: key);

  @override
  ClubListItemState createState() => ClubListItemState();
}

class ClubListItemState extends State<ClubListItem> {
  @override
  Widget build(BuildContext context) {
    var club = widget.club;

    return InkWell(onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ClubDetailView(club: club),
        ),
      );
    },
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: SizedBox(
        width: 360,
        height: 75,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CircleAvatar(
              radius: 37.5,
              backgroundColor: Colors.green,
              child: Icon(Icons.local_activity),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(club.name),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.person_3_rounded),
                    Text('${club.members.length}'),
                ],)
              ],
            )
          ]
        ),
      ),
    ),
    );
  }
}
