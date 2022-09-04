import 'package:flutter/material.dart';

// CUstom testfield for the input application
class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key, this.onChange, this.hint = "", this.controller})
      : super(key: key);

  // Accept onChange function
  final Function? onChange;
  // Accept hint
  final String? hint;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
      child: TextFormField(
        controller: controller,
        onChanged: (String query) {
          if (onChange != null) {
            onChange!(query);
          }
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 15,
            color: Color(0xffb5b5b5),
          ),
        ),
      ),
    );
  }
}
