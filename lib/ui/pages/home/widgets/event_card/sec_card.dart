// lib/ui/pages/category/view/sub_tab/call/new_year_card.dart

import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/pages/home/widgets/event_card/widgets/%08custom_card.dart';

class SecCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomListCard(
      title: '다가오는 OO',
      subtitle: '소중한 사람들에게 연락을 통해 더욱 의미 있는 OO를 맞이해보는 것은 어떠신가요?',
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('다가오는 OO 카드 클릭됨')),
        );
      },
    );
  }
}
