import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:test/models/todo.dart';
import 'package:test/shared/base_url.dart';
import 'package:test/todo.dart';
import 'package:http/http.dart' as http;
import 'package:test/widgets/add_todo.dart';
import 'package:test/widgets/alert_dialog.dart';
import 'package:test/widgets/custom_text_field.dart';
import 'package:test/widgets/todo_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Todo> todos = [];
  List<Todo> filteredTodo = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getTodos();
  }

  getTodos() async {
    var url = "${baseUrl}get_todo.php";
    var parseUri = Uri.parse(url);
    var resp = await http.get(parseUri);
    var decoded = json.decode(resp.body);

    List<Todo> todoList = AllTodo.fromJson(decoded).todo!;

    setState(() {
      todos = todoList;
      filteredTodo = todoList;
    });
  }

  searchTodo(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredTodo = todos;
      });
    } else {
      List<Todo> temp = [];

      todos.map((e) {
        if (e.title!.toLowerCase().contains(query.toLowerCase())) {
          temp.add(e);
        }
      }).toList();

      setState(() {
        filteredTodo = temp;
      });
    }
  }

  deleteTodo(String id) async {
    var url = "${baseUrl}delete_todo.php";
    var parseUri = Uri.parse(url);
    var resp = await http.post(parseUri, body: {'id': id});
    var decoded = json.decode(resp.body);

    if (decoded['success']) {
      print('Success');
      getTodos();
    } else {
      print('Failed');
    }
  }

  onTodoAdd() {
    print(titleController.text);
    print(descriptionController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'To Do',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 40,
              color: Color(0xff000000),
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                showDialog(
                    context: (context),
                    builder: (context) => Dialog(
                          child: AddTodo(
                              titleController: titleController,
                              descriptionController: descriptionController,
                              onCancel: () {
                                Navigator.pop(context);
                              },
                              onConfirm: () {
                                onTodoAdd();
                              }),
                        ));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(14.0),
                  border:
                      Border.all(width: 1.0, color: const Color(0xff707070)),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              CustomTextField(
                hint: 'Search . . .',
                onChange: searchTodo,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: filteredTodo
                      .map(
                        (Todo todo) => Slidable(
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (val) {},
                                backgroundColor: const Color(0xFF93B7FF),
                                foregroundColor: Colors.white,
                                icon: Icons.edit,
                                label: 'Edit',
                              ),
                              SlidableAction(
                                onPressed: (val) {
                                  customAlertDialog(
                                      context: context,
                                      title: 'Delete',
                                      content:
                                          'Are you sure you want to delete this todo?',
                                      onConfirm: () {
                                        Navigator.pop(context);
                                        deleteTodo(todo.id!);
                                      });
                                },
                                backgroundColor: const Color(0xFFff0000),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Todos()));
                            },
                            child: TodoCard(todo: todo),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ))
            ],
          ),
        ));
  }
}
