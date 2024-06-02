import 'package:flutter/material.dart';

class LanguageButton extends StatelessWidget {
  final String text;
  final String flagAsset;
  final VoidCallback onPressed;

  LanguageButton(
    {
    required this.text,
    required this.flagAsset,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
       // primary: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.grey.shade300),
        ),
        elevation: 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          Image.asset(
            flagAsset,
            height: 24,
          ),
        ],
      ),
    );
  }
}