import 'package:flutter/material.dart';

typedef ImageButtonOnTap = void Function(int score);


class ImageButton extends StatelessWidget {
  int correctAnswer = 0;
  int val = 0;
  ImageButtonOnTap onTap;
  ImageButton(
      {Key? key,
      required this.correctAnswer,
      required this.val,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          var message = 'Your answer is worong';
          var score = 0;
          var ansColor = Colors.red;

          if (correctAnswer == val) {
            message = 'Your answer is correct';
            ansColor = Colors.green;
            score = 10;
          }
          onTap(score);
          final snackBar = SnackBar(
            content: Text(message),
            duration: const Duration(seconds: 1),
            backgroundColor: ansColor,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }, // Handle your callback.
        child: Ink(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/$val.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
  toList() {}
}
