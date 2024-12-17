import 'package:flutter_fillit_app/data/model/post_category.dart';

class PostCategoryRepository {
  Future<List<PostCategory>?> getCategoryList() async {
    // 실제 서버나 Firestore에서 카테고리 목록을 가져오는 로직 구현
    // 예시: 하드코딩된 카테고리 목록 반환
    return [
      PostCategory(id: '1', name: '정보공유'),
      PostCategory(id: '2', name: 'QnA'),
      PostCategory(id: '3', name: '자유게시판'),
    ];
  }
}
