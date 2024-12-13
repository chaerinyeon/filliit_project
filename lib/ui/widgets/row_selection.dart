// lib/ui/widgets/selection_row.dart

import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/widgets/custom/button_style.dart';

class SelectionRow extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final Function(String) onCategorySelected;
  final Map<String, String> displayLabels;

  const SelectionRow({
    Key? key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
    required this.displayLabels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(categories.length * 2 - 1, (index) {
        if (index.isOdd) {
          // 구분선
          return Container(
            width: 1,
            height: 24,
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: Color(0xffd6dde3),
              borderRadius: BorderRadius.circular(1),
            ),
          );
        } else {
          // 카테고리 항목
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
            isSelected: isSelected,
          );
        }
      }),
    );
  }
}
