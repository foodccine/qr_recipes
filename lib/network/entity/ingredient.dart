import 'package:json_annotation/json_annotation.dart';

import 'food_product.dart';
import 'ingredinets_group.dart';

part 'ingredient.g.dart';

@JsonSerializable()
class IngredientEntity {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'food_product')
  final FoodProductEntity? product;

  @JsonKey(name: 'ingredients_group')
  final IngredientsGroupEntity? group;

  @JsonKey(name: 'quantity')
  final double? quantity;

  @JsonKey(name: 'unit')
  final String? unit;

  @JsonKey(name: 'is_optional')
  final bool? isOptional;

  IngredientEntity(this.id, this.product, this.group, this.quantity, this.unit,
      this.isOptional);

  factory IngredientEntity.fromJson(Map<String, dynamic> json) =>
      _$IngredientEntityFromJson(json);
  Map<String, dynamic> toJson() => _$IngredientEntityToJson(this);
}
