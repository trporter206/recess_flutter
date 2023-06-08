import 'package:flutter/material.dart';

import '../../../models/club.dart';

class ClubDetailView extends StatefulWidget {
  final Club club;
  const ClubDetailView({super.key, required this.club});

  @override
  ClubDetailViewState createState() => ClubDetailViewState();
}

class ClubDetailViewState extends State<ClubDetailView> {
  @override
  Widget build(BuildContext context) {
    Club club = widget.club;
    bool joined = club.members.contains('Torri Porter');
    bool areCreator = club.creator == 'Torri Porter';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Club',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(club.name),
            Text(club.creator),
            Text(club.description),
            !areCreator 
              ? ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (joined) {
                        club.removeMember("Torri Porter");
                        joined = false;
                      } else {
                        club.addMember("Torri Porter");
                        joined = true;
                      }
                    });
                  },
                  child: Text(joined ? "Leave" : "Join"),
                ) : 
                const Text('Welcome to your club'),
            club.type == 'private'
            ? Text(club.howToJoin) 
            : const Text('Anyone can join this club')
          ]
        ),
      ),
    );
  }
}
