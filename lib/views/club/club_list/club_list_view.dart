import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recess_flutter/main.dart';

import '../../../models/club.dart';
import 'club_list_item.dart';

class ClubListView extends StatefulWidget {
  const ClubListView({Key? key}) : super(key: key);

  @override
  ClubListViewState createState() => ClubListViewState();
}

class ClubListViewState extends State<ClubListView> {
  late List<Club> clubs;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    clubs = appState.clubs;

    return Scaffold(
      body: ListView(
        children: clubs.map((Club club) {
          return Center(
            child: ClubListItem(club: club),
          );
        }).toList(),
      ),
    );
  }
}
