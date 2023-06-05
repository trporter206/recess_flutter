import 'dart:core';

class Activity {
  String id;
  int points;
  String title;
  String sport;
  int playerCount;
  DateTime date;
  String description;
  String creator;
  List<String> players;
  List<double> coordinates;
  bool currentlyActive;

  Activity({
    required this.title, 
    required this.sport, 
    required this.date, 
    required this.coordinates, 
    required this.creator, 
    this.description = '', 
  }) : id = DateTime.now().millisecondsSinceEpoch.toString(),
       playerCount = 1,
       points = 50,
       players = [creator],
       currentlyActive = false;

  void addPlayer(String playerId) {
    if (!players.contains(playerId)) {
      players.add(playerId);
      playerCount++;
    }
  }

  void removePlayer(String playerId) {
    if (players.contains(playerId)) {
      players.remove(playerId);
      playerCount--;
    }
  }
}
