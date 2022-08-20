// Create a class model
class AllTodo {
  bool? success;
  List<Todo>? todo;

  // Create a constructor
  AllTodo({this.success, this.todo});

  // AllTodo(bool success, List<Todo>? todo) {
  //   this.success = success;
  //   this.todo = todo;
  // }

  // Create a fromJson method
  // Converts a json object to a AllTodo object
  AllTodo.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      todo = <Todo>[];
      json['data'].forEach((v) {
        todo!.add(Todo.fromJson(v));
      });
    }
  }

  // Create a toJson method
  // Converts a AllTodo object to a json object
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (todo != null) {
      data['data'] = todo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// Create a class model
class Todo {
  String? id;
  String? title;
  String? description;
  String? date;
  // Create a constructor
  Todo({this.id, this.title, this.description, this.date});

  // Create a fromJson method
  // Converts a json object to a Todo object
  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    date = json['date'];
  }

  // Create a toJson method

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['date'] = date;
    return data;
  }
}
