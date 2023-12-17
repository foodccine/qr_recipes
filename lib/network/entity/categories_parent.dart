import 'package:json_annotation/json_annotation.dart';

part 'categories_parent.g.dart';

@JsonSerializable()
class CategoriesParentEntity {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'index')
  final int? index;

  CategoriesParentEntity(this.id, this.name, this.index);

  factory CategoriesParentEntity.fromJson(Map<String, dynamic> json) =>
      _$CategoriesParentEntityFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesParentEntityToJson(this);
}
