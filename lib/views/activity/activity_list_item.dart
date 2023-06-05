import 'package:flutter/material.dart';
import 'package:recess_flutter/views/activity/activity_detail/activity_detail_view.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../models/activity.dart';

class ActivityListItem extends StatefulWidget {
  final Activity activity;

  const ActivityListItem({Key? key, required this.activity}) : super(key: key);

  @override
  ActivityListItemState createState() => ActivityListItemState();
}

class ActivityListItemState extends State<ActivityListItem> {
  @override
  Widget build(BuildContext context) {
    var activity = widget.activity;
    // var formattedDate = DateFormat('MMM d, h:mma').format(activity.date);
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
        shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: SizedBox(
          width: 360,
          height: 75,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const CircleAvatar(
                  radius: 37.5,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.location_on),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activity.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.person_3_rounded),
                        Text('${activity.playerCount}'),
                        const Icon(Icons.calendar_month_rounded),
                        Text('${activity.date.weekday}')
                      ],
                    )
                  ],
                )
              ],
            ),
        ),
      ),
    );
  }
}
