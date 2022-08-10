import 'package:flutter/material.dart';
import 'package:test/models/todo.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(width: 1.0, color: const Color(0x80cfcfcf)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x29000000),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            todo.title!,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 23,
              color: Color(0xff000000),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            todo.date!,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15,
              color: Color(0xff000000),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            todo.description!,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15,
              color: Color(0xff000000),
            ),
          )
        ],
      ),
    );
  }
}
