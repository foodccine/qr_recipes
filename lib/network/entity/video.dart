import 'package:json_annotation/json_annotation.dart';

import 'subtitle.dart';

part 'video.g.dart';

@JsonSerializable()
class VideoEntity {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'file')
  final String? file;

  @JsonKey(name: 'subtitle')
  final SubtitleEntity? subtitle;

  VideoEntity(this.id, this.file, this.subtitle);

  factory VideoEntity.fromJson(Map<String, dynamic> json) =>
      _$VideoEntityFromJson(json);
  Map<String, dynamic> toJson() => _$VideoEntityToJson(this);
}
