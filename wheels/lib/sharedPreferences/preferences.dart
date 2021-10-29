import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wheels/models/groupModel.dart';

class PreferencesService {
  void changeGroupSubscription(String groupId) async {
    final preferences = await SharedPreferences.getInstance();
    var current = preferences.getBool(groupId);

    if (current == false) {
      preferences.setBool(groupId, true);
    } else {
      preferences.setBool(groupId, false);
    }

    //await preferences.setStringList(key, value);
  }

  dynamic getSubsciptionStatus(String groupId) async {
    final preferences = await SharedPreferences.getInstance();
    if (preferences.getBool(groupId) == null) {
      preferences.setBool(groupId, false);
      return false;
    } else {
      return preferences.getBool(groupId);
    }
  }
}
