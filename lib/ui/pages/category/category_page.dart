// lib/ui/pages/category/category_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/pages/category/model/tab_item.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/call_target/call_personal/call_personal_family.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/call_target/call_personal/call_personal_friend.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/call_target/call_personal/call_personal_others.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/call_target/call_service/call_service_feedback.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/call_target/call_service/call_service_inquiry.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/call_target/call_service/call_service_support.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/call_target/call_sos/%20call_sos_disaster_response.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/call_target/call_sos/call_sos_emergency_contacts.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/call_target/call_sos/call_sos_first_aid.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/call_target/call_study/call_study_assignment.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/call_target/call_study/call_study_exam.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/call_target/call_study/call_study_group.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/call_target/call_work/call_work_meeting.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/call_target/call_work/call_work_presentation.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/call_target/call_work/call_work_report.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/mail_target/mail_personal/mail_personal_family.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/mail_target/mail_personal/mail_personal_friend.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/mail_target/mail_personal/mail_personal_others.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/mail_target/mail_study/mail_study_assignment.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/mail_target/mail_study/mail_study_exam.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/mail_target/mail_study/mail_study_group.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/mail_target/mail_work/mail_work_meeting.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/mail_target/mail_work/mail_work_presentation.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/mail_target/mail_work/mail_work_report.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/message_target/message_personal/message_personal_family.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/message_target/message_personal/message_personal_friend.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/message_target/message_personal/message_personal_others.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/message_target/message_service/message_service_inquiry.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/message_target/message_service/message_service_support.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/message_target/message_service/message_servicee_feedback.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/message_target/message_study/message_study_assignment.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/message_target/message_study/message_study_exam.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/message_target/message_study/message_study_group.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/message_target/message_work/message_work_meeting.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/message_target/message_work/message_work_presentation.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/message_target/message_work/message_work_report.dart';
import 'package:flutter_fillit_app/ui/widgets/row_selection.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with TickerProviderStateMixin {
  // 메인 카테고리 리스트
  final List<String> _phraseCategories = ['call', 'message', 'mail'];

  // 현재 선택된 메인 카테고리
  String _selectedPhraseCategory = 'call';

  // displayLabels map
  final Map<String, String> _displayLabels = {
    'call': '전화',
    'message': '메세지',
    'mail': '메일',
  };

  // 메인 카테고리에 따른 서브 탭 리스트
  final Map<String, List<String>> _categorySubTabs = {
    'call': [
      '개인', // Personal
      '업무', // Work
      '학업', // Study
      '서비스/문의', // Service/Inquiry
      '긴급/비상', // SOS/Emergency
    ],
    'message': [
      '개인',
      '업무',
      '학업',
      '서비스/문의',
    ],
    'mail': [
      '개인',
      '업무',
      '학업',
    ],
  };

  // 서브 서브 카테고리에 따른 리스트
  final Map<String, List<String>> _subSubCategories = {
    '개인': ['친구', '가족', '기타모임'],
    '업무': ['회의', '보고', '프레젠테이션'],
    '학업': ['과제', '시험', '스터디'],
    '서비스/문의': ['고객지원', '피드백', '문의사항'],
    '긴급/비상': ['응급처치', '재난대응', '긴급연락처'],
  };

  // 현재 선택된 서브 탭
  String _selectedSubTab = '개인';

  // 현재 선택된 서브 서브 탭
  String _selectedSubSubTab = '친구';

  // TabController for sub-tabs
  late TabController _subTabController;

  @override
  void initState() {
    super.initState();
    _initializeSubTabController();
  }

  void _initializeSubTabController() {
    final subTabs = _categorySubTabs[_selectedPhraseCategory] ?? [];
    _subTabController = TabController(length: subTabs.length, vsync: this);
    _subTabController.addListener(() {
      if (_subTabController.indexIsChanging) {
        setState(() {
          _selectedSubTab = subTabs[_subTabController.index];
          _selectedSubSubTab = _subSubCategories[_selectedSubTab]?.first ?? '';
        });
      }
    });
  }

  @override
  void dispose() {
    _subTabController.dispose();
    super.dispose();
  }

  // 메인 카테고리 선택 콜백: SelectionRow에서 호출
  void _onMainCategorySelected(String category) {
    if (category == _selectedPhraseCategory) return;

    setState(() {
      _selectedPhraseCategory = category;
      _selectedSubTab = _categorySubTabs[_selectedPhraseCategory]?.first ?? '';
      _selectedSubSubTab = _subSubCategories[_selectedSubTab]?.first ?? '';

      // 기존의 TabController를 폐기하고 새로 초기화합니다.
      _subTabController.dispose();
      _initializeSubTabController();
    });
  }

  // 서브 탭 선택 콜백: TabBar onTap에서 호출
  void _onSubTabSelected(int index) {
    String selected = _categorySubTabs[_selectedPhraseCategory]![index];
    if (selected == _selectedSubTab) return;

    setState(() {
      _selectedSubTab = selected;
      _selectedSubSubTab = _subSubCategories[_selectedSubTab]?.first ?? '';
    });
  }

  // 서브 서브 카테고리 선택 콜백: 메뉴 바에서 호출
  void _onSubSubCategorySelected(String subSubTab) {
    if (subSubTab == _selectedSubSubTab) return;

    setState(() {
      _selectedSubSubTab = subSubTab;
    });
  }

  // 각 서브 서브 탭에 대한 콘텐츠 위젯을 반환합니다.
  Widget _getSubSubTabContent(
      String category, String subTab, String subSubTab) {
    switch (category) {
      case 'call':
        switch (subTab) {
          case '개인':
            switch (subSubTab) {
              case '친구':
                return CallPersonalFriend();
              case '가족':
                return CallPersonalFamily();
              case '기타모임':
                return CallPersonalOthers();
              default:
                return Center(child: Text('$subSubTab Content'));
            }
          case '업무':
            switch (subSubTab) {
              case '회의':
                return CallWorkMeeting();
              case '보고':
                return CallWorkReport();
              case '프레젠테이션':
                return CallWorkPresentation();
              default:
                return Center(child: Text('$subSubTab Content'));
            }
          case '학업':
            switch (subSubTab) {
              case '과제':
                return CallStudyAssignment();
              case '시험':
                return CallStudyExam();
              case '스터디':
                return CallStudyGroup();
              default:
                return Center(child: Text('$subSubTab Content'));
            }
          case '서비스/문의':
            switch (subSubTab) {
              case '고객지원':
                return CallServiceSupport();
              case '피드백':
                return CallServiceFeedback();
              case '문의사항':
                return CallServiceInquiry();
              default:
                return Center(child: Text('$subSubTab Content'));
            }
          case '긴급/비상':
            switch (subSubTab) {
              case '응급처치':
                return CallSosFirstAid();
              case '재난대응':
                return CallSosDisasterResponse();
              case '긴급연락처':
                return CallSosEmergencyContacts();
              default:
                return Center(child: Text('$subSubTab Content'));
            }
          default:
            return Center(child: Text('$subTab Content'));
        }
      case 'message':
        switch (subTab) {
          case '개인':
            switch (subSubTab) {
              case '친구':
                return MessagePersonalFriend();
              case '가족':
                return MessagePersonalFamily();
              case '기타모임':
                return MessagePersonalOthers();
              default:
                return Center(child: Text('$subSubTab Content'));
            }
          case '업무':
            switch (subSubTab) {
              case '회의':
                return MessageWorkMeeting();
              case '보고':
                return MessageWorkReport();
              case '프레젠테이션':
                return MessageWorkPresentation();
              default:
                return Center(child: Text('$subSubTab Content'));
            }
          case '학업':
            switch (subSubTab) {
              case '과제':
                return MessageStudyAssignment();
              case '시험':
                return MessageStudyExam();
              case '스터디':
                return MessageStudyGroup();
              default:
                return Center(child: Text('$subSubTab Content'));
            }
          case '서비스/문의':
            switch (subSubTab) {
              case '고객지원':
                return MessageServiceSupport();
              case '피드백':
                return MessageServiceFeedback();
              case '문의사항':
                return MessageServiceInquiry();
              default:
                return Center(child: Text('$subSubTab Content'));
            }
          default:
            return Center(child: Text('$subTab Content'));
        }
      case 'mail':
        switch (subTab) {
          case '개인':
            switch (subSubTab) {
              case '친구':
                return MailPersonalFriend();
              case '가족':
                return MailPersonalFamily();
              case '기타모임':
                return MailPersonalOthers();
              default:
                return Center(child: Text('$subSubTab Content'));
            }
          case '업무':
            switch (subSubTab) {
              case '회의':
                return MailWorkMeeting();
              case '보고':
                return MailWorkReport();
              case '프레젠테이션':
                return MailWorkPresentation();
              default:
                return Center(child: Text('$subSubTab Content'));
            }
          case '학업':
            switch (subSubTab) {
              case '과제':
                return MailStudyAssignment();
              case '시험':
                return MailStudyExam();
              case '스터디':
                return MailStudyGroup();
              default:
                return Center(child: Text('$subSubTab Content'));
            }
          default:
            return Center(child: Text('$subTab Content'));
        }
      default:
        return Center(child: Text('$subTab Content'));
    }
  }

  @override
  Widget build(BuildContext context) {
    // 메인 탭 아이템 정의 (배지 포함)
    final mainTabItems = _phraseCategories.map((category) {
      int? badgeCount;
      if (category == 'call') badgeCount = 2; // 'call' 탭에 배지 추가
      if (category == 'message') badgeCount = 5; // 'message' 탭에 배지 추가
      // 'mail' 탭에는 배지 추가하지 않음
      return TabItem(
        title: _displayLabels[category] ?? category,
        badgeCount: badgeCount,
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
        actions: [
          IconButton(
            onPressed: () {
              // Search button 클릭 시
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Search button clicked')),
              );
            },
            icon: const Icon(Icons.search_outlined),
          ),
          IconButton(
            onPressed: () {
              // Alarm button 클릭 시
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Alarm button clicked')),
              );
            },
            icon: Icon(MdiIcons.bellOutline),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 메인 카테고리 선택 SelectionRow
            SizedBox(
              height: 50, // 적절한 높이로 설정 (필요에 따라 조정)
              child: SelectionRow(
                categories: _phraseCategories,
                selectedCategory: _selectedPhraseCategory,
                onCategorySelected: _onMainCategorySelected, // 콜백 전달
                displayLabels: {
                  'call': '전화',
                  'message': '메세지',
                  'mail': '메일',
                },
                axis: Axis.horizontal, // 메인 카테고리는 수평으로 정렬
              ),
            ),
            SizedBox(height: 10),
            // 서브 탭 바
            _categorySubTabs[_selectedPhraseCategory]?.isNotEmpty ?? false
                ? TabBar(
                    controller: _subTabController,
                    isScrollable: true,
                    tabs: _categorySubTabs[_selectedPhraseCategory]!
                        .map((subTab) => Tab(text: subTab))
                        .toList(),
                    indicatorColor: Color.fromARGB(255, 139, 62, 255),
                    labelColor: Color.fromARGB(255, 139, 62, 255),
                    unselectedLabelColor: Color.fromARGB(179, 91, 90, 90),
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    unselectedLabelStyle:
                        TextStyle(fontWeight: FontWeight.normal),
                    onTap: _onSubTabSelected, // 수정된 onTap 콜백
                  )
                : Container(),
            SizedBox(height: 5),
            // 서브 서브 카테고리 메뉴 바와 콘텐츠를 Row로 배치
            _categorySubTabs[_selectedPhraseCategory]
                        ?.contains(_selectedSubTab) ??
                    false
                ? Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 서브 서브 카테고리 메뉴 바
                        Container(
                          width: 150, // 메뉴 바의 너비 설정
                          child: ListView.builder(
                            itemCount:
                                _subSubCategories[_selectedSubTab]!.length,
                            itemBuilder: (context, index) {
                              String subSubTab =
                                  _subSubCategories[_selectedSubTab]![index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    _onSubSubCategorySelected(subSubTab);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor:
                                        _selectedSubSubTab == subSubTab
                                            ? Colors.white
                                            : Colors.black,
                                    backgroundColor:
                                        _selectedSubSubTab == subSubTab
                                            ? const Color.fromARGB(
                                                255, 136, 136, 136)
                                            : const Color.fromARGB(
                                                255, 255, 255, 255),
                                    fixedSize:
                                        Size(double.infinity, 50), // 동일한 크기
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                      side: BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                  child: Align(
                                    alignment:
                                        Alignment.centerLeft, // 텍스트 왼쪽 정렬
                                    child: Text(subSubTab),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 10), // 메뉴 바와 콘텐츠 간 간격
                        // 서브 서브 탭 콘텐츠
                        Expanded(
                          child: _getSubSubTabContent(_selectedPhraseCategory,
                              _selectedSubTab, _selectedSubSubTab),
                        ),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
