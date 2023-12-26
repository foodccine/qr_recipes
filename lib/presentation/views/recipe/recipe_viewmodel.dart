import 'dart:async';

import 'package:qr_recipes/app/functions.dart';
import 'package:qr_recipes/domain/models/recipe_direction.dart';
import 'package:qr_recipes/domain/models/recipe_information.dart';
import 'package:qr_recipes/domain/models/recipe_ingredient_group.dart';
import 'package:qr_recipes/network/entity/direction.dart';
import 'package:qr_recipes/network/entity/ingredient.dart';
import 'package:qr_recipes/network/entity/ingredinets_group.dart';
import 'package:qr_recipes/presentation/common/cache_manager.dart';
import 'package:qr_recipes/presentation/resources/strings_manager.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../services/dependencies.dart';
import '../../../app/settings.dart';
import '../../../domain/models/recipe_ingredient.dart';
import '../../base/api_widget/base_api_viewmodel.dart';

class RecipeScreenViewModel extends BaseApiViewModel
    implements RecipeScreenViewModelFunctions {
  RecipeInformationModel? informationModel;
  List<RecipeIngredientGroupModel> ingredientsGroupsModel = [];
  List<RecipeDirectionModel> directionsModel = [];
  Function? onSuccess;

  @override
  void requestRecipe(String identifier) {
    loading();
    DependenciesService.getDataClient()
        .getRecipeById(
            identifier, DependenciesService.getBrandModel().identifier)
        .then(
      (value) {
        informationModel = RecipeInformationModel(
          1,
          value.identifier ?? '',
          value.views ?? 0,
          value.image ?? '',
          value.video != null ? value.video!.file ?? '' : '',
          value.name ?? '',
          value.time ?? 0,
          value.serving != null ? value.serving ?? 0 : 0,
        );
        ingredientsGroupsModel = buildIngredients(value.ingredients!);
        directionsModel = buildDirections(value.directions!);
        if (ingredientsGroupsModel.isNotEmpty && directionsModel.isNotEmpty) {
          success();
          if (onSuccess != null) {
            onSuccess!();
          }
        } else {
          empty();
        }
      },
    ).onError(
      (e, stackTrace) {
        empty();
      },
    );
  }

  List<RecipeIngredientGroupModel> buildIngredients(
      List<IngredientEntity> entities) {
    Map<int, List<RecipeIngredientModel>> groupsIngredientsMap = {};
    Map<int, IngredientsGroupEntity> groupsMap = {};
    for (IngredientEntity e in entities) {
      int? groupId = e.group?.id!;
      if (!groupsIngredientsMap.containsKey(groupId)) {
        groupsIngredientsMap[groupId!] = [];
      }
      if (!groupsMap.containsKey(groupId)) {
        groupsMap[groupId!] = e.group!;
      }
      groupsIngredientsMap[groupId!]?.add(
        RecipeIngredientModel(
          e.product!.name!,
          '${AppFunctions.getIntegerFractionString(e.quantity!)}${AppFunctions.getDoubleFraction(e.quantity!)}${AppStrings.units[e.unit!]![DependenciesService.getLanguageIso()]!}',
        ),
      );
    }
    List<RecipeIngredientGroupModel> groups = [];
    var mapEntries = groupsIngredientsMap.entries.toList()
      ..sort((a, b) =>
          groupsMap[a.key]!.index!.compareTo(groupsMap[b.key]!.index!));

    groupsIngredientsMap
      ..clear()
      ..addEntries(mapEntries);
    groupsIngredientsMap.forEach((key, value) {
      groups.add(
        RecipeIngredientGroupModel(
          groupsMap[key]!.name!,
          value,
        ),
      );
    });
    return groups;
  }

  List<RecipeDirectionModel> buildDirections(List<DirectionEntity> entities) {
    List<RecipeDirectionModel> directions = [];
    for (DirectionEntity e in entities) {
      directions.add(RecipeDirectionModel(
        e.index!,
        e.text!,
        e.image!,
      ));
      AppCacheManager().downloadFile(e.image!);
    }
    return directions;
  }

  @override
  void shareRecipe() {
    Share.share(
        '${informationModel!.name}: ${DependenciesService.getBrandModel().domain}${AppKeys.recipePath}/${informationModel!.identifier}');
  }

  @override
  void setSuccessFunction(Function successFunction) {
    onSuccess = successFunction;
  }
}

abstract class RecipeScreenViewModelFunctions {
  void requestRecipe(String identifier);

  void shareRecipe();

  void setSuccessFunction(Function successFunction);
}
