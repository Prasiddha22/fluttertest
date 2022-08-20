// Create a class model
class AllTodo {
  bool? success;
  List<Todo>? todo;

  AllTodo({this.success, this.todo});

  // AllTodo(bool success, List<Todo>? todo) {
  //   this.success = success;
  //   this.todo = todo;
  // }

  AllTodo.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      todo = <Todo>[];
      json['data'].forEach((v) {
        todo!.add(Todo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (todo != null) {
      data['data'] = todo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Todo {
  String? id;
  String? title;
  String? description;
  String? date;

  Todo({this.id, this.title, this.description, this.date});

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['date'] = date;
    return data;
  }
}
