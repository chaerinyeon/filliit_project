// lib/ui/widgets/popular_posts.dart

import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/pages/community/commu_detail/community_post_detail_page.dart';
import 'package:flutter_fillit_app/ui/pages/home/widgets/popular_community/custom_widgets/community_post_item.dart';
import 'package:flutter_fillit_app/ui/pages/home/widgets/popular_community/popular_posts_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopularPosts extends ConsumerStatefulWidget {
  @override
  _PopularPostsState createState() => _PopularPostsState();
}

class _PopularPostsState extends ConsumerState<PopularPosts> {
  late PageController _pageController;
  // ignore: unused_field
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final popularPostsState = ref.watch(popularPostsViewModelProvider);
    final popularPostsViewModel =
        ref.read(popularPostsViewModelProvider.notifier);

    // Loading State
    if (popularPostsState.isLoading) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // Error State
    if (popularPostsState.errorMessage != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        child: Center(
          child: Text(
            popularPostsState.errorMessage!,
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    }

    final topPosts = popularPostsState.topPosts;

    // Empty State
    if (topPosts.isEmpty) {
      return SizedBox.shrink();
    }

    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Card(
          elevation: 6, // 그림자 효과 추가
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 100, // Adjust height as needed
                child: PageView.builder(
                  controller: _pageController,
                  scrollDirection:
                      Axis.vertical, // Change to Axis.horizontal if desired
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  itemCount: topPosts.length,
                  itemBuilder: (context, index) {
                    final post = topPosts[index];
                    return GestureDetector(
                      onTap: () async {
                        try {
                          await popularPostsViewModel
                              .incrementClickCount(post.id);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${post.writer} 클릭됨')),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PostDetailPage(post: post),
                            ),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('클릭 수 증가에 실패했습니다.')),
                          );
                        }
                      },
                      child: CommunityPostItem(post: post),
                    );
                  },
                ),
              ),
              // Page Indicator
            ],
          ),
        ),
      ),
    );
  }
}
