// lib/ui/pages/community/create_community_post_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/pages/community/community_post_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateCommunityPostPage extends ConsumerStatefulWidget {
  @override
  _CreateCommunityPostPageState createState() =>
      _CreateCommunityPostPageState();
}

class _CreateCommunityPostPageState
    extends ConsumerState<CreateCommunityPostPage> {
  final _formKey = GlobalKey<FormState>();
  String _selectedCategory = '정보공유';
  String _postTitle = '';
  String _writerName = '';
  String _postContent = ''; // content 필드 추가

  final List<String> _categories = ['정보공유', 'QnA', '자유게시판'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('게시글 작성'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            // 스크롤 가능하도록 수정
            child: Column(
              children: [
                // 카테고리 선택 드롭다운
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: '카테고리 선택',
                    border: OutlineInputBorder(),
                  ),
                  value: _selectedCategory,
                  items: _categories.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _selectedCategory = value;
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '카테고리를 선택해주세요.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                // 게시글 제목 입력
                TextFormField(
                  decoration: InputDecoration(
                    labelText: '게시글 제목',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    _postTitle = value!.trim();
                  },
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return '게시글 제목을 입력해주세요.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                // 게시글 내용 입력
                TextFormField(
                  decoration: InputDecoration(
                    labelText: '게시글 내용',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 5, // 여러 줄 입력 가능하도록 설정
                  onSaved: (value) {
                    _postContent = value!.trim();
                  },
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return '게시글 내용을 입력해주세요.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                // 작성자 이름 입력
                TextFormField(
                  decoration: InputDecoration(
                    labelText: '작성자 이름',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    _writerName = value!.trim();
                  },
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return '작성자 이름을 입력해주세요.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),
                // 게시글 추가 버튼
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Firestore에 게시글 추가
                      try {
                        await ref.read(postViewModelProvider.notifier).addPost(
                              title: _postTitle,
                              writer: _writerName,
                              content: _postContent, // content 전달
                              category: _selectedCategory,
                            );
                        // 성공적으로 추가되었음을 사용자에게 알림
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('게시글이 추가되었습니다.')),
                        );
                        // 이전 페이지로 돌아가기
                        Navigator.pop(context);
                      } catch (e) {
                        // 에러 발생 시 사용자에게 알림
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('게시글 추가에 실패했습니다.')),
                        );
                      }
                    }
                  },
                  child: Text('게시글 추가'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50), // 버튼 너비 확장
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
