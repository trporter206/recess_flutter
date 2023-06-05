import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recess_flutter/main.dart';
import '../../models/activity.dart';

class CreateActivityView extends StatefulWidget {
  const CreateActivityView({super.key});

  @override
  CreateActivityViewState createState() => CreateActivityViewState();
}

class CreateActivityViewState extends State<CreateActivityView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String title = '';
  String sport = '';
  String description = '';
  DateTime date = DateTime.now();
  List<double> coordinates = [0.0, 0.0]; // update this as per your requirement

  var sports = ['Basketball', 'Soccer', 'Volleyball'];

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var activities = appState.activities;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Activity'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Title'),
                onSaved: (value) {
                  title = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField(
                decoration: const InputDecoration(labelText: 'Sport'),
                value: sport.isEmpty ? null : sport,
                items: sports.map((String sport) {
                  return DropdownMenuItem(
                    value: sport,
                    child: Text(sport),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    sport = value.toString();
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a sport';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                onSaved: (value) {
                  description = value!;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    activities.add(Activity(
                      title: title,
                      sport: sport,
                      date: date,
                      coordinates: coordinates,
                      description: description,
                      creator: appState.currentUser.name,
                    ));
                  }
                },
                child: const Text('Save Activity'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
