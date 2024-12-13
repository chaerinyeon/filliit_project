import 'package:flutter/material.dart';

class EventCardSection extends StatelessWidget {
  final List<String> events = [
    '추석 맞이 특별 추천 문구',
    '설날 맞이 특별 추천 문구',
    '발렌타인데이 인기 문구',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
      child: SizedBox(
        height: 150.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: events.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                width: 300.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFFE0E0E0),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 15,
                      spreadRadius: 7.5,
                      color: Color(0xFFBEBEBE),
                      offset: Offset(15, 15),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 15,
                      spreadRadius: 7.5,
                      offset: Offset(-15, -15),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    events[index],
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
