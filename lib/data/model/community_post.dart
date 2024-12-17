// lib/data/model/community_post.dart

import 'package:cloud_firestore/cloud_firestore.dart';

class CommunityPost {
  final String id;
  final String writer;
  final String title;
  final String content;
  final int clickCount;
  final DateTime createdAt;
  final String category;

  CommunityPost({
    required this.id,
    required this.writer,
    required this.title,
    required this.content,
    required this.clickCount,
    required this.createdAt,
    required this.category,
  });

  // Factory constructor to create a CommunityPost from Firestore document
  factory CommunityPost.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CommunityPost(
      id: doc.id,
      writer: data['writer'] ?? '',
      title: data['title'] ?? '',
      content: data['content'] ?? '',
      clickCount: data['clickCount'] ?? 0,
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      category: data['category'] ?? '전체', // Default to '전체' (All)
    );
  }

  // Convert CommunityPost to Map (useful for Firestore)
  Map<String, dynamic> toMap() {
    return {
      'writer': writer,
      'title': title,
      'content': content,
      'clickCount': clickCount,
      'createdAt': Timestamp.fromDate(createdAt),
      'category': category,
    };
  }
}
