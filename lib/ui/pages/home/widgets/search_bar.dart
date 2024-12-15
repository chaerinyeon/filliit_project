import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: '키워드로 검색하세요',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onSubmitted: (query) {
          if (query.isNotEmpty) {
            print('검색어: $query');
          } else {
            print('검색어가 입력되지 않았습니다.');
          }
        },
      ),
    );
  }
}
