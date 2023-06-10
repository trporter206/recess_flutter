import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recess_flutter/main.dart';
import '../../models/activity.dart';
import '../../widgets/buttons.dart';
import '../activity/activity_list/activity_list_item.dart';
import 'widgets/dashboard_clubs_list.dart';
import 'widgets/dashboard_header.dart';
import 'widgets/next_activity.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var currentUser = appState.currentUser;
    var userClubs = appState.clubs
        .where((club) =>
            club.members.contains(currentUser.name) ||
            club.creator == currentUser.name)
        .toList();
    var scheduledActivities = appState.activities
        .where((activity) => activity.players.contains(currentUser.name))
        .toList();
    scheduledActivities.sort((a, b) => a.date.compareTo(b.date));

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const DashboardHeader(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CreateActivityButton(), CreateClubButton()],
          ),
          DashboardClubList(clubs: userClubs),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Your Next Activity'),
          ),
          NextActivity(activity: scheduledActivities[0]),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Your Scheduled Activities'),
          ),
          Column(
            children: scheduledActivities.sublist(1).map((Activity activity) {
              return Center(
                child: ActivityListItem(activity: activity),
              );
            }).toList(),
          ),
        ],
      ),
    ));
  }
}
