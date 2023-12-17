import 'package:json_annotation/json_annotation.dart';

part 'recipe_rating.g.dart';

@JsonSerializable()
class RecipeRatingEntity {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'comment')
  final String? comment;

  @JsonKey(name: 'stars')
  final int? stars;

  @JsonKey(name: 'created_at')
  final String? date;

  RecipeRatingEntity(
    this.id,
    this.name,
    this.comment,
    this.stars,
    this.date,
  );

  factory RecipeRatingEntity.fromJson(Map<String, dynamic> json) =>
      _$RecipeRatingEntityFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeRatingEntityToJson(this);
}
