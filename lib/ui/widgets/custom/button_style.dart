// lib/ui/widgets/styled_button.dart

import 'package:flutter/material.dart';

// 버튼의 위치를 나타내는 enum
enum ButtonVariant { left, middle, right }

class StyledButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final ButtonVariant variant;
  final bool isSelected;

  const StyledButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.variant = ButtonVariant.middle,
    this.isSelected = false,
  }) : super(key: key);

  BorderRadius _getBorderRadius() {
    switch (variant) {
      case ButtonVariant.left:
        return BorderRadius.only(
          topLeft: Radius.circular(8.0),
          bottomLeft: Radius.circular(8.0),
        );
      case ButtonVariant.right:
        return BorderRadius.only(
          topRight: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        );
      case ButtonVariant.middle:
        return BorderRadius.zero;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        borderRadius: _getBorderRadius(),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color.fromARGB(210, 189, 84, 207)
                : Colors.grey[100],
            borderRadius: _getBorderRadius(),
          ),
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? Colors.grey[100]
                    : Color.fromARGB(210, 144, 67, 157),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
