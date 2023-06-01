class ToDoItems {
  String? title;
  int? status; // 0: not done, 1: done
  bool? isDelete;
  ToDoItems({this.title, this.status, this.isDelete});

  ToDoItems.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    status = json['status'];
    isDelete = json['isDelete'];
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'status': status,
      'isDelete': isDelete,
    };
  }
}

List<ToDoItems> Items = [];
