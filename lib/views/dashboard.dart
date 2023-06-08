import 'package:flutter/material.dart';
import 'package:recess_flutter/views/creation/create_club.dart';
import 'creation/create_activity.dart';

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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CreateActivityButton(),
          CreateClubButton()
        ],
      )
    );
  }
}

class CreateActivityButton extends StatelessWidget {
  const CreateActivityButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateActivityView()),
          );
        },
        child: const Text("Create Activity"));
  }
}

class CreateClubButton extends StatelessWidget {
  const CreateClubButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateClubView()),
          );
        },
        child: const Text("Create Club"));
  }
}
