// lib/ui/widgets/button_style.dart

import 'package:flutter/material.dart';

// 버튼의 위치를 나타내는 enum
enum ButtonVariant { left, middle, right }

class StyledButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final ButtonVariant variant;
  final bool selected;

  const StyledButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.variant = ButtonVariant.middle,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BorderRadius 설정
    BorderRadius borderRadius;
    switch (variant) {
      case ButtonVariant.left:
        borderRadius = BorderRadius.only(
          topLeft: Radius.circular(24.0),
          bottomLeft: Radius.circular(24.0),
        );
        break;
      case ButtonVariant.right:
        borderRadius = BorderRadius.only(
          topRight: Radius.circular(24.0),
          bottomRight: Radius.circular(24.0),
        );
        break;
      case ButtonVariant.middle:
        borderRadius = BorderRadius.zero;
    }

    return Semantics(
      button: true,
      selected: selected,
      label: label,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: selected ? Colors.grey[300] : Colors.white,
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: borderRadius,
            onTap: onPressed,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                  color: selected ? Colors.grey[800] : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
