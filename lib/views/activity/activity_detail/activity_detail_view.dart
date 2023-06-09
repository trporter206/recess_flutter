import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recess_flutter/main.dart';
import 'package:recess_flutter/widgets/buttons.dart';
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
    var appState = context.watch<MyAppState>();
    Activity activity = widget.activity;
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
            if (areCreator)
              ActivityActiveButton(activity: activity)
            else
              ActivityPlayerButton(activity: activity),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  appState.deleteActivity(activity);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                )
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.lightBlueAccent,
    );
  }
}
