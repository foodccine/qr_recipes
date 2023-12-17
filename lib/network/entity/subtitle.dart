import 'package:json_annotation/json_annotation.dart';

import 'language.dart';

part 'subtitle.g.dart';

@JsonSerializable()
class SubtitleEntity {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'language')
  final LanguageEntity? language;

  @JsonKey(name: 'file')
  final String? file;

  SubtitleEntity(this.id, this.language, this.file);

  factory SubtitleEntity.fromJson(Map<String, dynamic> json) =>
      _$SubtitleEntityFromJson(json);
  Map<String, dynamic> toJson() => _$SubtitleEntityToJson(this);
}
