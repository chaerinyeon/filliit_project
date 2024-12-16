import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/pages/home/widgets/event_card/widgets/%08custom_card.dart';

class ThirdCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomListCard(
      title: '다가오는 XX',
      subtitle: '소중한 사람들에게 연락을 통해 더욱 의미 있는 XX를 맞이해보는 것은 어떠신가요?',
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('다가오는 XX 카드 클릭됨')),
        );
      },
    );
  }
}
