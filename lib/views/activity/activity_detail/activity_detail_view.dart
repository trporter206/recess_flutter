import 'package:flutter/material.dart';
import '../../../models/activity.dart';
import '../../../models/user.dart';
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
  void initState() {
    super.initState();
    // Call the equivalent of onAppear here
  }

  // void onAppear(Activity activity) {
  //   getUserInfo(activity.creator);
  //   getPlayerList(activity.players);
  // }

  // void getUserInfo(String id) {
  //   // Firestore call to get user info goes here
  //   notifyListeners();
  // }

  // void getPlayerList(List<String> playerIds) {
  //   playerList = [];
  //   for (var id in playerIds) {
  //     // Firestore call to get user info goes here
  //   }
  //   notifyListeners();
  // }

  @override
  Widget build(BuildContext context) {
    Activity activity = widget.activity;
    bool joined = activity.players.contains("Torri Porter");
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
            // Container(
            //   height: 260,
            //   child: ActivityMapView(coordinate: Coordinates(activity.coordinates[0], activity.coordinates[1])),
            // ),
            PlayerProfileLink(activity: activity),
            ActivityDescription(activity: activity),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(color: Colors.black),
            ),
            ActivityStatus(activity: activity),
            Container(
              height: 200, // adjust this value as needed
              child: ListView(
                  children: activity.players.map((String player) {
                return Text(player);
              }).toList()),
            ),
            ActivityDateView(activity: activity),
            ElevatedButton(
              onPressed: () {
                if (joined) {
                  activity.removePlayer("Torri Porter");
                } else {
                  activity.addPlayer("Torri Porter");
                }
                setState(() {
                  joined = !joined;
                });
              },
              child: Text(joined ? "Leave" : "Join"),
            ),
            // ActivityActionButtonView(activity: activity),
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
