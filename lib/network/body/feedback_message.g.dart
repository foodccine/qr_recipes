// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackBody _$FeedbackBodyFromJson(Map<String, dynamic> json) => FeedbackBody(
      json['guest'] as String?,
      json['message'] as String?,
    );

Map<String, dynamic> _$FeedbackBodyToJson(FeedbackBody instance) =>
    <String, dynamic>{
      'guest': instance.guest,
      'message': instance.message,
    };
