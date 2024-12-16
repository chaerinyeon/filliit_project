// lib/viewmodels/post_viewmodel.dart

import 'dart:async';
import 'package:flutter_fillit_app/data/model/community_post.dart';
import 'package:flutter_fillit_app/data/repository/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostViewModel extends StateNotifier<List<CommunityPost>> {
  final PostRepository _postRepository;
  late final StreamSubscription<List<CommunityPost>> _subscription;

  PostViewModel(this._postRepository) : super([]) {
    _subscription = _postRepository.getPostsStream().listen(
      (posts) {
        print('PostViewModel received ${posts.length} posts');
        // 상태를 업데이트 (이미 최근 작성 순으로 정렬됨)
        state = posts;
      },
      onError: (error) {
        print('Error in PostViewModel stream: $error');
      },
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  // 게시글 추가
  Future<void> addPost({
    required String title,
    required String writer,
    required String content,
    required String category,
  }) async {
    try {
      await _postRepository.addPost(
        title: title,
        writer: writer,
        content: content,
        category: category,
      );
      print('Post added successfully');
    } catch (e) {
      print('Error in addPost: $e');
      rethrow;
    }
  }

  // 클릭 수 증가
  Future<void> incrementClickCount(String postId) async {
    try {
      await _postRepository.incrementClickCount(postId);
      print('Click count incremented for postId: $postId');
    } catch (e) {
      print('Error in incrementClickCount: $e');
      rethrow;
    }
  }

  // 카테고리별 게시글 반환
  List<CommunityPost> getPostsByCategory(String category) {
    if (category == '전체') {
      return state;
    } else {
      return state.where((post) => post.category == category).toList();
    }
  }
}

// Provider 설정
final postRepositoryProvider = Provider<PostRepository>((ref) {
  return PostRepository();
});

final postViewModelProvider =
    StateNotifierProvider<PostViewModel, List<CommunityPost>>((ref) {
  final repository = ref.watch(postRepositoryProvider);
  return PostViewModel(repository);
});
