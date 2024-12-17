import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_fillit_app/data/model/community_post.dart';

class PostRepository {
  final FirebaseFirestore _firestore;

  // Constructor with optional Firestore injection for testing
  PostRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  // /// 게시글 추가
  Future<void> addPost(CommunityPost post) async {
    try {
      await _firestore.collection('posts').add({
        'writer': post.writer,
        'title': post.title,
        'content': post.content,
        'clickCount': post.clickCount,
        'createdAt': FieldValue.serverTimestamp(),
        'category': post.category,
      });
    } catch (e) {
      throw Exception('Failed to add post: $e');
    }
  }

  /// 클릭 수 증가
  // Increment click count for a specific post
  Future<void> incrementClickCount(String postId) async {
    try {
      final postRef = _firestore.collection('posts').doc(postId);
      await _firestore.runTransaction((transaction) async {
        final snapshot = await transaction.get(postRef);
        if (!snapshot.exists) {
          throw Exception('Post does not exist!');
        }
        final currentCount = snapshot.get('clickCount') ?? 0;
        transaction.update(postRef, {'clickCount': currentCount + 1});
      });
    } catch (e) {
      throw Exception('Failed to increment click count: $e');
    }
  }

//   /// 모든 게시글 가져오기 (Stream 형태)

  Stream<List<CommunityPost>> streamAllPosts() {
    return _firestore
        .collection('posts')
        .orderBy('clickCount', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => CommunityPost.fromDocument(doc))
          .toList();
    });
  }

//   /// 단일 게시글 가져오기
  Future<CommunityPost> getPostById(String postId) async {
    try {
      final doc = await _firestore.collection('posts').doc(postId).get();
      if (!doc.exists) {
        throw Exception('Post not found!');
      }
      return CommunityPost.fromDocument(doc);
    } catch (e) {
      throw Exception('Failed to fetch post: $e');
    }
  }
}
