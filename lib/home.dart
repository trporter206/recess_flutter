import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recess_flutter/main.dart';
import 'package:recess_flutter/views/activity/activity_detail/activity_detail_view.dart';
import 'package:recess_flutter/views/activity/activity_list/activity_list_view.dart';
import 'package:recess_flutter/views/creation/create_activity.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var activity = appState.activities[0];
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const CreateActivityView();
        break;
      case 1:
        page = const ActivityListView();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(child: page),
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Activities',
              ),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
            }) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
