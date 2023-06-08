import 'package:flutter/material.dart';
import '../../../models/activity.dart';
import 'activity_detail_widgets.dart';

class ActivityDetailView extends StatefulWidget {
  final Activity activity;
  const ActivityDetailView({super.key, required this.activity});

  @override
  ActivityDetailViewState createState() => ActivityDetailViewState();
}

class ActivityDetailViewState extends State<ActivityDetailView> {
  // bool showingReviewSheet = false;
  // bool showingAlert = false;

  @override
  Widget build(BuildContext context) {
    Activity activity = widget.activity;
    bool joined = activity.players.contains("Torri Porter");
    bool areCreator = activity.creator == "Torri Porter";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Activity',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ActivityHeader(activity: activity),
            ActivityDescription(activity: activity),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(color: Colors.black),
            ),
            ActivityStatus(activity: activity),
            SizedBox(
              height: 200, // adjust this value as needed
              child: ListView(
                  children: activity.players.map((String player) {
                return Text(player);
              }).toList()),
            ),
            ActivityDateView(activity: activity),
            areCreator 
              ? ElevatedButton(
                  onPressed: () {
                    setState(() {
                      activity.currentlyActive = !activity.currentlyActive;
                    });
                  },
                  child: Text(activity.currentlyActive ? "End" : "Start"),
                )
              : ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (joined) {
                        activity.removePlayer("Torri Porter");
                        joined = false;
                      } else {
                        activity.addPlayer("Torri Porter");
                        joined = true;
                      }
                    });
                  },
                  child: Text(joined ? "Leave" : "Join"),
                ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // EditActivityButton(activity: activity),
                // ActivityDeleteButton(activity: activity),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.lightBlueAccent,
    );
  }
}
