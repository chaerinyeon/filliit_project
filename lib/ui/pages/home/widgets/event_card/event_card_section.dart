import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/pages/home/widgets/event_card/new_year_card.dart';
import 'package:flutter_fillit_app/ui/pages/home/widgets/event_card/sec_card.dart';
import 'package:flutter_fillit_app/ui/pages/home/widgets/event_card/third_card.dart';

class EventCardSection extends StatefulWidget {
  @override
  _EventCardSectionState createState() => _EventCardSectionState();
}

class _EventCardSectionState extends State<EventCardSection> {
  final List<Widget Function()> events = [
    () => NewYearCard(),
    () => SecCard(),
    () => ThirdCard(),
    // 추가적인 카드 위젯을 여기에 추가
  ];

  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose(); // PageController 해제
    super.dispose();
  }

  // 페이지 인디케이터 빌드 메서드
  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(events.length, (index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          width: _currentPage == index ? 12.0 : 8.0,
          height: _currentPage == index ? 12.0 : 8.0,
          decoration: BoxDecoration(
            color: _currentPage == index
                ? const Color.fromARGB(255, 103, 101, 101)
                : Colors.grey,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200, // 원하는 높이로 조절
          width: double.infinity,
          child: PageView.builder(
            controller: _pageController,
            itemCount: events.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: events[index](),
              );
            },
          ),
        ),
        SizedBox(height: 10), // 페이지 인디케이터와 카드 사이 간격
        _buildPageIndicator(),
      ],
    );
  }
}
