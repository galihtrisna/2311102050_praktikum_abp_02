import 'package:flutter/material.dart';

class TodoProvider with ChangeNotifier {
  final List<String> _todos = [];

  List<String> get todos => _todos;

  // Fitur menambah tugas
  void addTodo(String task) {
    if (task.isNotEmpty) {
      _todos.add(task);
      notifyListeners(); // Memberitahu UI untuk me-render ulang
    }
  }

  // Fitur menghapus seluruh tugas
  void clearAllTodos() {
    _todos.clear();
    notifyListeners();
  }
}