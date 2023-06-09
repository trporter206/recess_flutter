import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recess_flutter/main.dart';

import '../models/activity.dart';
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CreateActivityView()),
            );
          },
          child: const Text("Create Activity")),
    );
  }
}

//button for navigating to club creation screen
class CreateClubButton extends StatelessWidget {
  const CreateClubButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreateClubView()),
            );
          },
          child: const Text("Create Club")),
    );
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

class ActivityPlayerButton extends StatefulWidget {
  final Activity activity;
  const ActivityPlayerButton({super.key, required this.activity});

  @override
  ActivityPlayerButtonState createState() => ActivityPlayerButtonState();
}

class ActivityPlayerButtonState extends State<ActivityPlayerButton> {
  bool playing = false;

  @override
  Widget build(BuildContext context) {
    var activity = widget.activity;
    var appState = context.watch<MyAppState>();
    playing = activity.players.contains(appState.currentUser.name);

    return ElevatedButton(
      onPressed: () {
        setState(() {
          if (playing) {
            appState.removePlayerFromActivity(appState.currentUser.name, activity);
          } else {
            appState.addPlayerToActivity(appState.currentUser.name, activity);
          }
        });
      },
      child: Text(playing ? "Leave" : "Join"),
    );
  }
}

class ActivityActiveButton extends StatefulWidget {
  final Activity activity;
  const ActivityActiveButton({super.key, required this.activity});

  @override
  ActivityActiveButtonState createState() => ActivityActiveButtonState();
}

class ActivityActiveButtonState extends State<ActivityActiveButton> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    var activity = widget.activity;
    var appState = context.watch<MyAppState>();
    active = activity.currentlyActive;

    return ElevatedButton(
      onPressed: () {
        setState(() {
          appState.toggleActivityStatus(activity);
        });
      },
      child: Text(active ? "End" : "Start"),
    );
  }
}
