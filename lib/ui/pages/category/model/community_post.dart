// lib/models/community_post.dart

class CommunityPost {
  final String name;
  final String artist;
  int clickCount;

  CommunityPost({
    required this.name,
    required this.artist,
    this.clickCount = 0,
  });
}
