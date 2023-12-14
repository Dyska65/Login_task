import "package:flutter/material.dart";

class SubmitButton extends StatelessWidget {
  static const double _textSize = 16;
  static const double _defaultPaddingHorizontal = 50;
  static const double _defaultPaddingVertical = 10;
  static const double _borderRadius = 20;
  static const String _fontRoboto = "Roboto";

  final VoidCallback? onPress;
  final String text;
  final Color color;

  const SubmitButton({
    super.key,
    this.onPress,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(_borderRadius),
          ),
        ),
      ),
      onPressed: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: _defaultPaddingHorizontal,
          vertical: _defaultPaddingVertical,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.white,
            letterSpacing: 0.3,
            fontFamily: _fontRoboto,
            fontSize: _textSize,
          ),
        ),
      ),
    );
  }
}
