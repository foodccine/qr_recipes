import 'package:json_annotation/json_annotation.dart';

part 'feedback_message.g.dart';

@JsonSerializable()
class FeedbackBody {
  @JsonKey(name: 'guest')
  final String? guest;

  @JsonKey(name: 'message')
  final String? message;

  FeedbackBody(this.guest, this.message);

  factory FeedbackBody.fromJson(Map<String, dynamic> json) =>
      _$FeedbackBodyFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackBodyToJson(this);
}
