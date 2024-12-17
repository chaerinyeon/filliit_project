// lib/ui/widgets/popular_posts_view_model.dart

import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_fillit_app/data/model/community_post.dart';
import 'package:flutter_fillit_app/data/repository/post_repository.dart';

// Define the state for PopularPosts
class PopularPostsState {
  final bool isLoading;
  final List<CommunityPost> topPosts;
  final String? errorMessage;

  PopularPostsState({
    required this.isLoading,
    required this.topPosts,
    this.errorMessage,
  });

  // Initial state
  factory PopularPostsState.initial() {
    return PopularPostsState(
      isLoading: false,
      topPosts: [],
      errorMessage: null,
    );
  }

  // CopyWith method for immutability
  PopularPostsState copyWith({
    bool? isLoading,
    List<CommunityPost>? topPosts,
    String? errorMessage,
  }) {
    return PopularPostsState(
      isLoading: isLoading ?? this.isLoading,
      topPosts: topPosts ?? this.topPosts,
      errorMessage: errorMessage,
    );
  }
}

// Define the ViewModel
class PopularPostsViewModel extends StateNotifier<PopularPostsState> {
  final PostRepository _postRepository;
  late final Stream<List<CommunityPost>> _postsStream;
  late final StreamSubscription<List<CommunityPost>> _subscription;

  PopularPostsViewModel(this._postRepository)
      : super(PopularPostsState.initial()) {
    _postsStream = _postRepository.streamAllPosts();
    _subscription = _postsStream.listen((allPosts) {
      final topFivePosts = allPosts.take(5).toList();
      state = state.copyWith(topPosts: topFivePosts, isLoading: false);
    }, onError: (error) {
      state = state.copyWith(
        errorMessage: '게시글을 불러오는 데 실패했습니다.',
        isLoading: false,
      );
    });

    // Set loading state initially
    state = state.copyWith(isLoading: true);
  }

  // Increment click count for a post
  Future<void> incrementClickCount(String postId) async {
    try {
      await _postRepository.incrementClickCount(postId);
      // The stream will automatically update the state
    } catch (e) {
      throw Exception('클릭 수 증가에 실패했습니다.');
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

// Define the provider for PostRepository
final postRepositoryProvider = Provider<PostRepository>((ref) {
  return PostRepository();
});

// Define the provider for PopularPostsViewModel
final popularPostsViewModelProvider =
    StateNotifierProvider<PopularPostsViewModel, PopularPostsState>((ref) {
  final repository = ref.watch(postRepositoryProvider);
  return PopularPostsViewModel(repository);
});
