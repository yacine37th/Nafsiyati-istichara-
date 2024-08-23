import 'package:flutter/material.dart';

import '../../theme/main_colors.dart';

class CustomButton extends StatelessWidget {
  final Function onPress;
  final String text;
  final Color colorbtn;
  final Color textColor;
  const CustomButton({
    super.key,
    required this.onPress,
    required this.text,
    required this.colorbtn,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: TextButton(
        onPressed: () {
          onPress();
        },
        style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(colorbtn),
            backgroundColor: WidgetStateProperty.all(colorbtn),
            overlayColor: WidgetStateColor.resolveWith(
                (states) => Colors.white.withOpacity(0.1)),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
                side: const BorderSide(
                    color: AppColors.transparentColor, width: 0)))),
        child: Container(
          height: 30,
          alignment: Alignment.center,
          width: double.maxFinite,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          child: Text(
            text,
            style: TextStyle(
                color: textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
