// lib/models/community_post.dart

import 'package:flutter_fillit_app/ui/widgets/custom/time_stamp.dart';
import 'package:json_annotation/json_annotation.dart';

part 'community_post.g.dart';

@JsonSerializable()
class CommunityPost {
  final String id; // Firestore 문서 ID
  final String title;
  final String writer;
  final String content; // 게시글 내용
  final String category; // '정보공유', 'QnA', '자유게시판'
  final int clickCount;

  @TimestampConverter()
  final DateTime createdAt; // 게시글 생성 시간

  CommunityPost({
    required this.id,
    required this.title,
    required this.writer,
    required this.content,
    required this.category,
    this.clickCount = 0,
    required this.createdAt,
  });

  // JSON에서 객체로 변환
  factory CommunityPost.fromJson(Map<String, dynamic> json) =>
      _$CommunityPostFromJson(json);

  // 객체를 JSON으로 변환
  Map<String, dynamic> toJson() => _$CommunityPostToJson(this);
}
