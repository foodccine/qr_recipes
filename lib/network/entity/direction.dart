import 'package:json_annotation/json_annotation.dart';

part 'direction.g.dart';

@JsonSerializable()
class DirectionEntity {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'image')
  final String? image;

  @JsonKey(name: 'index')
  final int? index;

  @JsonKey(name: 'text')
  final String? text;

  @JsonKey(name: 'time')
  final int? time;

  DirectionEntity(this.id, this.image, this.index, this.text, this.time);

  factory DirectionEntity.fromJson(Map<String, dynamic> json) =>
      _$DirectionEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DirectionEntityToJson(this);
}
