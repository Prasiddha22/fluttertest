import 'package:flutter/material.dart';

// Custom alert dialog for the application
customAlertDialog(
    {context,
    title,
    content,
    cancelText = "Cancel",
    confirmText = "Confirm",
    onConfirm}) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(cancelText)),
              ElevatedButton(
                  onPressed: () {
                    onConfirm();
                  },
                  child: Text(confirmText))
            ],
          ));
}
