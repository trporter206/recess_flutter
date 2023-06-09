import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recess_flutter/main.dart';
import '../models/user.dart';
import '../widgets/buttons.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DashboardHeader(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CreateActivityButton(), CreateClubButton()],
        )
      ],
    ));
  }
}







class DashboardHeader extends StatefulWidget {
  const DashboardHeader({Key? key}) : super(key: key);

  @override
  DashboardHeaderState createState() => DashboardHeaderState();
}

class DashboardHeaderState extends State<DashboardHeader> {
  late User user;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    user = appState.currentUser;

    return Container(
      width: double.infinity,
      color: Colors.blue,
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: CircleAvatar(radius: 45),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Welcome,',
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 16, 
                        fontWeight: FontWeight.bold)
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(user.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 32,
                          color: Colors.white)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HeaderInfo(field: 'Tier ', value: '${user.tier}'),
                      HeaderInfo(field: 'Points ', value: '${user.points}'),
                      HeaderInfo(field: 'Rating ', value: user.rating),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}










class HeaderInfo extends StatelessWidget {
  const HeaderInfo({
    super.key,
    required this.field,
    required this.value
  });

  final String field;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: field,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
