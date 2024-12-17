// lib/ui/widgets/selection_row.dart

import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/widgets/custom/button_style.dart';

class SelectionRow extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final Function(String) onCategorySelected;
  final Map<String, String> displayLabels;
  final Axis axis; // 정렬 방향 추가 (수평/수직)

  SelectionRow({
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
    required this.displayLabels,
    this.axis = Axis.horizontal, // 기본은 수평
  });

  @override
  Widget build(BuildContext context) {
    if (axis == Axis.horizontal) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(categories.length * 2 - 1, (index) {
          if (index.isOdd) {
            // 구분선 (수평)
            return Container(
              width: 1,
              height: 24,
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              color: Color(0xffd6dde3),
            );
          } else {
            // 카테고리 버튼
            String category = categories[index ~/ 2];
            ButtonVariant variant;
            if (index ~/ 2 == 0) {
              variant = ButtonVariant.left;
            } else if (index ~/ 2 == categories.length - 1) {
              variant = ButtonVariant.right;
            } else {
              variant = ButtonVariant.middle;
            }

            bool isSelected = category == selectedCategory;

            return StyledButton(
              label: displayLabels[category] ?? category,
              onPressed: () {
                onCategorySelected(category);
              },
              variant: variant,
              selected: isSelected,
            );
          }
        }),
      );
    } else {
      // 수직 정렬
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(categories.length * 2 - 1, (index) {
          if (index.isOdd) {
            // 구분선 (수직)
            return Container(
              width: 1,
              height: 24,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              color: Color(0xffd6dde3),
            );
          } else {
            // 카테고리 버튼
            String category = categories[index ~/ 2];
            ButtonVariant variant;
            if (index ~/ 2 == 0) {
              variant = ButtonVariant.left;
            } else if (index ~/ 2 == categories.length - 1) {
              variant = ButtonVariant.right;
            } else {
              variant = ButtonVariant.middle;
            }

            bool isSelected = category == selectedCategory;

            return StyledButton(
              label: displayLabels[category] ?? category,
              onPressed: () {
                onCategorySelected(category);
              },
              variant: variant,
              selected: isSelected,
            );
          }
        }),
      );
    }
  }
}
