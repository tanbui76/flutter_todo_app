class ToDoItems {
  final String title;
  int status; // 0: not done, 1: done
  bool isDelete;
  ToDoItems(
      {required this.title, required this.status, required this.isDelete});

  factory ToDoItems.fromJson(Map<String, dynamic> json) {
    return ToDoItems(
        title: json['title'],
        status: json['status'],
        isDelete: json['isDelete']);
  }

  String toJson() {
    return '{"title": "$title", "status": "$status", "isDelete": "$isDelete"}';
  }
}

List<ToDoItems> Items = [];
