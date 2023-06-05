import 'package:flutter/material.dart';
import '../../../models/activity.dart';
import '../../../models/user.dart';
import 'activity_detail_widgets.dart';

class ActivityDetailView extends StatefulWidget {
  final Activity activity;
  const ActivityDetailView({super.key,  required this.activity });

  @override
  ActivityDetailViewState createState() => ActivityDetailViewState();
}

class ActivityDetailViewState extends State<ActivityDetailView> {
  User userInfo = User(name: "Torri Porter", emailAddress: 'torri@email.com', profilePicString: "pic1");
    List<User> playerList = [];
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Container(
            //   height: 260,
            //   child: ActivityMapView(coordinate: Coordinates(widget.activity.coordinates[0], widget.activity.coordinates[1])),
            // ),
            PlayerProfileLink(activity: widget.activity, userInfo: userInfo),
            ActivityDescription(activity: widget.activity),
            // Divider(),
            ActivityStatus(activity: widget.activity),
            ActivityPlayerList(playerList: playerList),
            ActivityDateView(activity: widget.activity),
            // ActivityActionButtonView(activity: widget.activity, playerList: playerList),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // EditActivityButton(activity: widget.activity),
                // ActivityDeleteButton(activity: widget.activity),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.lightBlueAccent,
    );
  }
}


