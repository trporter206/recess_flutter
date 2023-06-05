import 'package:recess_flutter/models/user.dart';

class Club {
  String id;
  String creator;
  String name;
  String sport;
  List<String> members;
  List<String> upcomingActivities;
  int numActivities;
  String type;
  String description;

  Club({
    required this.creator,
    required this.name,
    required this.sport,
    required this.type,
    required this.description,
  }) : id = DateTime.now().millisecondsSinceEpoch.toString(),
       members = [],
       upcomingActivities = [],
       numActivities = 0;

  void addMember(User user) {
    if (!members.contains(user.id)) {
      members.add(user.id);
    }
  }

  void removeMember(User user) {
    members.remove(user.id);
  }
}
