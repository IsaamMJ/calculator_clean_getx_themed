import 'package:flutter/material.dart';

Widget buildButton(String buttonText, Color buttonColor, VoidCallback onPressed) {
  return Container(
    margin: const EdgeInsets.all(6),
    child: SizedBox(
      width: 80,
      height: 80,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shadowColor: Colors.black54,
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.zero, // prevent extra internal padding
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: buttonColor == Colors.grey ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}
