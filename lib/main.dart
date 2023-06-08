import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recess_flutter/models/user.dart';
import 'home.dart';
import 'models/activity.dart';
import 'models/club.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyAppState(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'Recess'),
        ));
  }
}

class MyAppState extends ChangeNotifier {
  var sports = ['Basketball', 'Soccer', 'Volleyball'];
  var type = ['public', 'private'];
  var currentUser = User(
      name: "Torri Porter",
      emailAddress: 'torri@email.com',
      profilePicString: 'a1');
  var activities = <Activity>[
    Activity(
        title: 'Bowling and Brewskies',
        sport: 'Bowling',
        date: DateTime.now(),
        coordinates: [0.0, 0.0],
        creator: 'Torri Porter'),
    Activity(
        title: 'Blacktop Basketball',
        sport: 'Basketball',
        date: DateTime.now(),
        coordinates: [0.0, 0.0],
        creator: 'Lauren Lanning')
  ];
  var clubs = <Club>[
    Club(
        creator: 'Torri Porter',
        name: 'Underdog Portland Basketball',
        sport: 'Basketball',
        type: 'private',
        description: 'The official basketball club of underdog portland!')
  ];
}
