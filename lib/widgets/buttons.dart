import 'package:flutter/material.dart';

import '../views/creation/create_activity.dart';
import '../views/creation/create_club.dart';

//button for navigating to activity creation screen
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


//button for navigating to club creation screen
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