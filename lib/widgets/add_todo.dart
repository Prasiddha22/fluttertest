import 'package:flutter/material.dart';
import 'package:test/widgets/custom_text_field.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Add Todo',
                  style: TextStyle(fontSize: 25),
                ),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.clear)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomTextField(
              hint: 'Title',
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomTextField(
              hint: 'Description',
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Cancel'),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(onPressed: () {}, child: const Text('Add')),
              ],
            ),
          ],
        ));
  }
}
