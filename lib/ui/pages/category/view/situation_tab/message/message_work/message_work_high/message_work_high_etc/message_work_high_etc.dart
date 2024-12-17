import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/situation_tab/message/message_work/message_work_high/message_work_high_etc/new_year_card/intro.dart';
import 'package:flutter_fillit_app/ui/pages/home/widgets/event_card/custom_widgets/%08custom_card.dart';
import 'package:flutter_fillit_app/ui/pages/home/widgets/event_card/sec_card.dart';
import 'package:flutter_fillit_app/ui/pages/home/widgets/event_card/third_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MessageWorkHighEtc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Fillit'),
          actions: [
            IconButton(
              onPressed: () {
                // 찾기 버튼 클릭 시 동작
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('찾기 버튼이 클릭되었습니다')),
                );
              },
              icon: const Icon(Icons.search_outlined),
            ),
            IconButton(
              onPressed: () {
                // 알람 버튼 클릭 시 동작
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('알람 버튼이 클릭되었습니다')),
                );
              },
              icon: Icon(MdiIcons.bellOutline),
            ),
          ],
        ),
        body: Column(children: [
          SizedBox(
            height: 5,
          ),
          Divider(),
          // Container(
          //   padding: EdgeInsets.all(10),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(30),
          //   ),
          // ),
          Text(
            ' 메시지 -> 업무 -> 높은 존칭 -> 기타 ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          ExampleCard(),
          SecCard(),
          ThirdCard(),
        ]));
  }
}

class ExampleCard extends StatefulWidget {
  @override
  ExampleCardState createState() => ExampleCardState();
}

class ExampleCardState extends State<ExampleCard> {
  String? selectedIntro;
  String? selectedBody;
  String? selectedConclusion;

  @override
  Widget build(BuildContext context) {
    return CustomListCard(
        title: '다가오는 새해',
        subtitle: '소중한 사람들에게 연락을 통해 더욱 의미 있는 새해를 맞이해보는 것은 어떠신가요?',
        leading: Icon(
          Icons.event,
          color: Colors.white,
        ),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => IntroPage()));
        });
  }
}
