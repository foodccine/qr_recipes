import 'package:json_annotation/json_annotation.dart';

part 'ingredinets_group.g.dart';

@JsonSerializable()
class IngredientsGroupEntity {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'index')
  final int? index;

  IngredientsGroupEntity(this.id, this.name, this.index);

  factory IngredientsGroupEntity.fromJson(Map<String, dynamic> json) =>
      _$IngredientsGroupEntityFromJson(json);
  Map<String, dynamic> toJson() => _$IngredientsGroupEntityToJson(this);
}
