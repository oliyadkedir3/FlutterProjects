import 'package:all_to_do_docs_app/constants/colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
   final Function ()? onTop;
  const MyButton({super.key,required this.onTop});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            "Sign In",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
