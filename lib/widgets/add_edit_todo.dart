import 'package:flutter/material.dart';
import 'package:test/widgets/custom_text_field.dart';

class AddEditTodo extends StatelessWidget {
  const AddEditTodo({
    Key? key,
    this.titleController,
    this.descriptionController,
    this.onCancel,
    this.onConfirm,
    this.todoId,
  }) : super(key: key);

  final TextEditingController? titleController;
  final TextEditingController? descriptionController;
  final Function? onCancel;
  final Function? onConfirm;
  final String? todoId;

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
                Text(
                  '${todoId!.isNotEmpty ? 'Edit' : 'Add'} Todo',
                  style: const TextStyle(fontSize: 25),
                ),
                InkWell(
                    onTap: () {
                      onCancel!();
                    },
                    child: const Icon(Icons.clear)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              hint: 'Title',
              controller: titleController,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              hint: 'Description',
              controller: descriptionController,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    onCancel!();
                  },
                  child: const Text('Cancel'),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      onConfirm!();
                    },
                    child: Text(todoId!.isNotEmpty ? 'Update' : 'Add')),
              ],
            ),
          ],
        ));
  }
}
