import 'package:flutter/material.dart';

import '../../../models/activity.dart';
import '../../../models/user.dart';

class PlayerProfileLink extends StatefulWidget {
  final Activity activity;

  const PlayerProfileLink({
    super.key,
    required this.activity,
  });

  @override
  State<PlayerProfileLink> createState() => _PlayerProfileLinkState();
}

class _PlayerProfileLinkState extends State<PlayerProfileLink> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => PlayerProfile(testData: testData, userInfo: userInfo)),
              // );
            },
            child: const CircleAvatar(
              radius: 37.5,
              backgroundColor: Colors.red,
              child: Icon(Icons.location_on),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (widget.activity.title != "")
                Text(
                  widget.activity.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              Text(
                widget.activity.sport,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: widget.activity.title != ""
                      ? FontWeight.normal
                      : FontWeight.bold,
                ),
              ),
              Text(
                "Hosted by ${widget.activity.creator}",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ActivityDescription extends StatelessWidget {
  final Activity activity;

  const ActivityDescription({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    if (activity.description.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
        child: Text(
          activity.description,
          style: const TextStyle(
            color: Colors.blue, // Replace with your color code
            fontWeight: FontWeight.w300,
          ),
        ),
      );
    } else {
      return const SizedBox
          .shrink(); // Returns an empty container if description is empty
    }
  }
}

class ActivityStatus extends StatelessWidget {
  final Activity activity;

  const ActivityStatus({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    if (activity.currentlyActive) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          "Currently Active",
          style: TextStyle(
            color: Colors.orange, // Replace with your color code
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("This activity has not started yet"),
      );
    }
  }
}

class ActivityPlayerList extends StatelessWidget {
  final List<User> playerList;

  const ActivityPlayerList({super.key, required this.playerList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Players (${playerList.length})",
          style: const TextStyle(
            color: Colors.blue, // Replace with your color code
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              children: playerList.map((player) {
                return ProfilePicView(
                    profileString: player.profilePicString, rad: 30.0);
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class ActivityDateView extends StatelessWidget {
  final Activity activity;

  const ActivityDateView({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    // var formattedDate = DateFormat('MMM d, h:mma').format(activity.date);  // You can use other formats based on your requirements
    return const Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: Text(
        'Date: date',
        style: TextStyle(
          color: Colors.blue, // Replace with your color code
        ),
      ),
    );
  }
}

class ProfilePicView extends StatelessWidget {
  final String profileString;
  final double rad;

  const ProfilePicView(
      {super.key, required this.profileString, required this.rad});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: rad,
      backgroundColor: Colors.red,
      child: const Icon(Icons.location_on),
    );
  }
}
