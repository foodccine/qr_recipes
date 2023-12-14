import 'package:json_annotation/json_annotation.dart';

part 'language.g.dart';

@JsonSerializable()
class LanguageEntity {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'iso')
  final String? iso;

  @JsonKey(name: 'direction')
  final String? direction;

  LanguageEntity(this.id, this.name, this.iso, this.direction);

  factory LanguageEntity.fromJson(Map<String, dynamic> json) =>
      _$LanguageEntityFromJson(json);
  Map<String, dynamic> toJson() => _$LanguageEntityToJson(this);
}
