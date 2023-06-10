import 'package:flutter/material.dart';
import '../../../models/club.dart';
import '../../club/club_detail/club_detail_view.dart';

class DashboardClubList extends StatefulWidget {
  final List<Club> clubs;

  const DashboardClubList({super.key, required this.clubs});

  @override
  DashboardClubListState createState() => DashboardClubListState();
}

class DashboardClubListState extends State<DashboardClubList> {
  @override
  Widget build(BuildContext context) {
    var clubs = widget.clubs;
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Your Clubs'),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: clubs.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ClubDetailView(club: clubs[index]),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 40,
                    child: Text(clubs[index].name[0]),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}