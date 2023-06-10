import 'package:flutter/material.dart';

import '../../../models/activity.dart';
import '../../activity/activity_detail/activity_detail_view.dart';

class NextActivity extends StatefulWidget {
  final Activity activity;
  const NextActivity({super.key, required this.activity});

  @override
  NextActivityState createState() => NextActivityState();
}

class NextActivityState extends State<NextActivity> {
  @override
  Widget build(BuildContext context) {
    var activity = widget.activity;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ActivityDetailView(activity: widget.activity),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(radius: 40),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(activity.title),
                      Text(activity.sport),
                      Text('Hosted by ${activity.creator}'),
                      const Divider(
                        height: 20,
                        endIndent: 8,
                        color: Colors.black,
                      ),
                      Text(activity.date.toString())
                    ],
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${activity.players.length} Players'),
          ),
          SizedBox(
            height: 50.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: activity.players.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 30,
                    child: Text(activity.players[index][0]),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(activity.description),
              ),
            ],
          )
        ]),
      ),
    );
  }
}