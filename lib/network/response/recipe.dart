import 'package:json_annotation/json_annotation.dart';

import '../entity/recipe.dart';
import 'base.dart';

part 'recipe.g.dart';

@JsonSerializable()
class RecipesResponse extends PaginationResponse {
  final List<RecipeEntity>? results;

  RecipesResponse(int? count, String? next, String? previous, this.results)
      : super(count, next, previous);

  factory RecipesResponse.fromJson(Map<String, dynamic> json) =>
      _$RecipesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RecipesResponseToJson(this);
}
