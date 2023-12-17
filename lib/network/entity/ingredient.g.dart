// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientEntity _$IngredientEntityFromJson(Map<String, dynamic> json) =>
    IngredientEntity(
      json['id'] as int?,
      json['food_product'] == null
          ? null
          : FoodProductEntity.fromJson(
              json['food_product'] as Map<String, dynamic>),
      json['ingredients_group'] == null
          ? null
          : IngredientsGroupEntity.fromJson(
              json['ingredients_group'] as Map<String, dynamic>),
      (json['quantity'] as num?)?.toDouble(),
      json['unit'] as String?,
      json['is_optional'] as bool?,
    );

Map<String, dynamic> _$IngredientEntityToJson(IngredientEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'food_product': instance.product,
      'ingredients_group': instance.group,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'is_optional': instance.isOptional,
    };
