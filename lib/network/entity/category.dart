import 'package:json_annotation/json_annotation.dart';

import 'categories_parent.dart';

part 'category.g.dart';

@JsonSerializable()
class CategoryEntity {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'icon')
  final String? icon;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'category_parent')
  final CategoriesParentEntity? group;

  CategoryEntity(this.id, this.icon, this.name, this.group);

  factory CategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$CategoryEntityFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryEntityToJson(this);
}
