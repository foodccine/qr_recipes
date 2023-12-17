// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipesResponse _$RecipesResponseFromJson(Map<String, dynamic> json) =>
    RecipesResponse(
      json['count'] as int?,
      json['next'] as String?,
      json['previous'] as String?,
      (json['results'] as List<dynamic>?)
          ?.map((e) => RecipeEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipesResponseToJson(RecipesResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
