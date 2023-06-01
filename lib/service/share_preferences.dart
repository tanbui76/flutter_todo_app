import 'dart:convert';

import 'package:mid_term_flutter/models/to_do_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePrefs {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<List<ToDoItems>?> getTodo() async {
    SharedPreferences prefs = await _prefs;
    String? data = prefs.getString('listTodo');
    if (data == null) return null;

    List<Map<String, dynamic>> maps = jsonDecode(data)
        .cast<Map<String, dynamic>>() as List<Map<String, dynamic>>;
    List<ToDoItems> bills = maps.map((e) => ToDoItems.fromJson(e)).toList();
    return bills;
  }

  Future<void> addBills(List<ToDoItems> bills) async {
    List<Map<String, dynamic>> maps = bills.map((e) => e.toJson()).toList();
    SharedPreferences prefs = await _prefs;
    prefs.setString('listTodo', jsonEncode(maps));
  }
}
