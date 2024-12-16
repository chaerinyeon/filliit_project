import 'package:flutter/material.dart';

class CustomListCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;

  const CustomListCard({
    Key? key,
    required this.title,
    required this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 화면 너비에 따라 카드의 너비 조정
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth * 0.9; // 화면 너비의 90%

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Card(
        elevation: 6, // 그림자 효과 추가
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0), // 둥근 모서리
        ),
        child: Container(
          width: cardWidth,
          padding: EdgeInsets.all(10.0),
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                subtitle,
                style: TextStyle(fontSize: 14),
              ),
            ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
