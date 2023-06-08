import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recess_flutter/main.dart';

import '../../models/club.dart';

class CreateClubView extends StatefulWidget {
  const CreateClubView({Key? key}) : super(key: key);

  @override
  CreateClubState createState() => CreateClubState();
}

class CreateClubState extends State<CreateClubView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String name = '';
  String sport = '';
  String type = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var clubs = appState.clubs;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Club'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                onSaved: (value) {
                  name = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField(
                decoration: const InputDecoration(labelText: 'Sport'),
                value: sport.isEmpty ? null : sport,
                items: appState.sports.map((String sport) {
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
              DropdownButtonFormField(
                decoration: const InputDecoration(labelText: 'Type'),
                value: type.isEmpty ? null : type,
                items: appState.type.map((String type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    type = value.toString();
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a type';
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
                    clubs.add(Club(
                      name: name,
                      type: type,
                      sport: sport,
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
