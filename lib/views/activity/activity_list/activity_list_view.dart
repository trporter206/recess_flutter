import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recess_flutter/views/activity/activity_list/activity_list_item.dart';

import '../../../main.dart';
import '../../../models/activity.dart';

class ActivityListView extends StatefulWidget {
  const ActivityListView({Key? key}) : super(key: key);

  @override
  ActivityListViewState createState() => ActivityListViewState();
}

class ActivityListViewState extends State<ActivityListView> {
  late List<Activity> activities;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    activities = appState.activities;

    return Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Activities: ${activities.length}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView(
                children: activities.map((Activity activity) {
                  return Center(
                    child: ActivityListItem(activity: activity),
                  );
                }).toList(),
              ),
            )
          ],
        )
    );
  }
}

