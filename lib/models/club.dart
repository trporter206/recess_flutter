

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
  String howToJoin;

  Club({
    required this.creator,
    required this.name,
    required this.sport,
    required this.type,
    required this.description,
    required this.howToJoin,
  })  : id = DateTime.now().millisecondsSinceEpoch.toString(),
        members = [],
        upcomingActivities = [],
        numActivities = 0;

  void addMember(String userID) {
    if (!members.contains(userID)) {
      members.add(userID);
    }
  }

  void removeMember(String userID) {
    members.remove(userID);
  }
}
