import 'package:flutter/material.dart';
import 'package:recess_flutter/widgets/buttons.dart';

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
    // var appState = context.watch<MyAppState>();
    Club club = widget.club;
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
        child: Column(children: [
          Text(club.name),
          Text(club.creator),
          Text(club.description),
          if (!areCreator) ClubMemberButton(club: club) 
          else const Text('Welcome to your club'),
          if (club.type == 'private') Text(club.howToJoin) 
          else const Text('Anyone can join this club')
        ]),
      ),
    );
  }
}
