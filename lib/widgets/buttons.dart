import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recess_flutter/main.dart';

import '../models/club.dart';
import '../views/creation/create_activity.dart';
import '../views/creation/create_club.dart';

//button for navigating to activity creation screen
class CreateActivityButton extends StatelessWidget {
  const CreateActivityButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateActivityView()),
          );
        },
        child: const Text("Create Activity"));
  }
}

//button for navigating to club creation screen
class CreateClubButton extends StatelessWidget {
  const CreateClubButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateClubView()),
          );
        },
        child: const Text("Create Club"));
  }
}

class ClubMemberButton extends StatefulWidget {
  final Club club;
  const ClubMemberButton({super.key, required this.club});

  @override
  ClubMemberButtonState createState() => ClubMemberButtonState();
}

class ClubMemberButtonState extends State<ClubMemberButton> {
  bool joined = false;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    joined = appState.isMemberOfClub("Torri Porter", widget.club);

    return ElevatedButton(
      onPressed: () {
        setState(() {
          if (joined) {
            appState.removeMemberFromClub("Torri Porter", widget.club);
            joined = false;
          } else {
            appState.addMemberToClub("Torri Porter", widget.club);
            joined = true;
          }
        });
      },
      child: Text(joined ? "Leave" : "Join"),
    );
  }
}
