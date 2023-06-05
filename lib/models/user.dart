import 'dart:core';

import 'club.dart';

class User {
  String id;
  String name;
  int tier;
  int positiveRatingCount;
  List<Club> clubs;
  List<String> followers;
  List<String> following;
  List<String> achievements;
  String profilePicString;
  int points;
  int numRatings;
  String rating;
  String emailAddress;

  User({
    required this.name,
    required this.emailAddress,
    required this.profilePicString,
  }) : id = DateTime.now().millisecondsSinceEpoch.toString(),
       tier = 5,
       positiveRatingCount = 0,
       clubs = [],
       followers = [],
       following = [],
       achievements = [],
       points = 0,
       numRatings = 0,
       rating = "0.0";

  void addRating(int num) {
    if (num != 2) {
      numRatings++;
      if (num == 1) {
        positiveRatingCount++;
      }
    }
  }

  String updateRating(int rating) {
    addRating(rating);
    double newRating = (positiveRatingCount / numRatings) * 100;
    this.rating = newRating.toString();
    return newRating.toString();
  }

  void addPoints(int points) {
    points += points;
    checkTier();
  }

  void checkTier() {
    if (points > 800) {
      tier = 1;
    } else if (points > 500) {
      tier = 2;
    } else if (points > 250) {
      tier = 3;
    } else if (points > 100) {
      tier = 4;
    } else {
      tier = 5;
    }
    // Implement your Firebase Firestore logic here.
  }

  // Dart does not have the `Image` type. You might want to return the URL string directly.
  String getImage() {
    return profilePicString;
  }
}
