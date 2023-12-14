import 'package:json_annotation/json_annotation.dart';

part 'privacy_policy.g.dart';

@JsonSerializable()
class PrivacyPolicyEntity {
  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'text')
  final String text;

  PrivacyPolicyEntity(this.title, this.text);

  factory PrivacyPolicyEntity.fromJson(Map<String, dynamic> json) =>
      _$PrivacyPolicyEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PrivacyPolicyEntityToJson(this);
}
