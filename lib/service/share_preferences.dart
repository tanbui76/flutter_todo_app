import 'dart:convert';

import 'package:mid_term_flutter/models/to_do_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePrefs {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<bool> saveToDoList(List<ToDoItems> list) async {
    SharedPreferences preferences = await _prefs;
    String data = jsonEncode(list);
    return await preferences.setString("todolist", data);
  }

  Future<List<ToDoItems>?> getToDo() async {
    SharedPreferences preferences = await _prefs;
    String? data = preferences.getString("todolist");
    if (data == null) {
      return null;
    }
    List<Map<String, dynamic>> maps = jsonDecode(data)
        .cast<Map<String, dynamic>>() as List<Map<String, dynamic>>;
    List<ToDoItems> ToDolist = maps.map((e) => ToDoItems.fromJson(e)).toList();
    return ToDolist;
  }
}
