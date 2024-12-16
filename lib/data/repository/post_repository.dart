// lib/repository/post_repository.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_fillit_app/data/model/community_post.dart';

class PostRepository {
  // ignore: unused_field
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _postsCollection =
      FirebaseFirestore.instance.collection('posts');

  // 게시글 실시간 스트림
  Stream<List<CommunityPost>> getPostsStream() {
    return _postsCollection
        .orderBy('createdAt', descending: true) // 최근 작성 순으로 정렬
        .snapshots()
        .map((snapshot) {
      print('Received snapshot with ${snapshot.docs.length} documents');
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>?;

        if (data == null) {
          print('Document ${doc.id} has no data');
          return CommunityPost(
            id: doc.id,
            title: 'No Title',
            writer: 'Unknown',
            content: 'No Content',
            category: 'Uncategorized',
            clickCount: 0,
            createdAt: DateTime.now(),
          );
        }

        // JSON 형태로 변환하여 fromJson 메서드 사용
        return CommunityPost.fromJson({
          'id': doc.id,
          ...data,
        });
      }).toList();
    }).handleError((error) {
      print('Error in getPostsStream: $error');
      return [];
    });
  }

  // 게시글 추가
  Future<void> addPost({
    required String title,
    required String writer,
    required String content,
    required String category,
  }) async {
    try {
      await _postsCollection.add({
        'title': title,
        'writer': writer,
        'content': content, // content 필드 추가
        'category': category,
        'clickCount': 0,
        'createdAt': FieldValue.serverTimestamp(), // 서버 타임스탬프 설정
      });
      print('Post added successfully');
    } catch (e) {
      print('Error adding post: $e');
      rethrow;
    }
  }

  // 클릭 수 증가
  Future<void> incrementClickCount(String postId) async {
    try {
      final docRef = _postsCollection.doc(postId);
      final doc = await docRef.get();
      if (doc.exists) {
        int currentCount = doc['clickCount'] as int? ?? 0;
        await docRef.update({'clickCount': currentCount + 1});
        print('Click count incremented for postId: $postId');
      }
    } catch (e) {
      print('Error incrementing click count: $e');
      rethrow;
    }
  }
}
