// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityPost _$CommunityPostFromJson(Map<String, dynamic> json) =>
    CommunityPost(
      id: json['id'] as String,
      title: json['title'] as String,
      writer: json['writer'] as String,
      content: json['content'] as String,
      category: json['category'] as String,
      clickCount: (json['clickCount'] as num?)?.toInt() ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$CommunityPostToJson(CommunityPost instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'writer': instance.writer,
      'content': instance.content,
      'category': instance.category,
      'clickCount': instance.clickCount,
      'createdAt': instance.createdAt.toIso8601String(),
    };
