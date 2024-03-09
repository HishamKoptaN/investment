import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  Function()? ontap;
  String text;
  double? fontSize;
  MyButton(
      {super.key,
      this.fontSize,
      this.ontap,
      required this.text,
      ButtonStyle? style});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
