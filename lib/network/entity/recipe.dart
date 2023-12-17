import 'package:json_annotation/json_annotation.dart';

import 'category.dart';
import 'direction.dart';
import 'ingredient.dart';
import 'recipe_rating.dart';
import 'video.dart';

part 'recipe.g.dart';

@JsonSerializable()
class RecipeEntity {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'image')
  final String? image;

  @JsonKey(name: 'level')
  final String? level;

  @JsonKey(name: 'views')
  final int? views;

  @JsonKey(name: 'category')
  final List<CategoryEntity>? categories;

  @JsonKey(name: 'time')
  final int? time;

  @JsonKey(name: 'serving')
  final int? serving;

  @JsonKey(name: 'video')
  final VideoEntity? video;

  @JsonKey(name: 'ingredients')
  final List<IngredientEntity>? ingredients;

  @JsonKey(name: 'directions')
  final List<DirectionEntity>? directions;

  @JsonKey(name: 'ratings')
  final List<RecipeRatingEntity>? ratings;

  @JsonKey(name: 'type')
  final String? type;

  RecipeEntity(
    this.id,
    this.name,
    this.image,
    this.level,
    this.views,
    this.categories,
    this.time,
    this.serving,
    this.video,
    this.ingredients,
    this.directions,
    this.ratings,
    this.type,
  );

  factory RecipeEntity.fromJson(Map<String, dynamic> json) =>
      _$RecipeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeEntityToJson(this);
}
