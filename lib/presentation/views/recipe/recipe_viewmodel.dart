import 'dart:async';

import 'package:intl/intl.dart';
import 'package:qr_recipes/app/functions.dart';
import 'package:qr_recipes/domain/models/recipe_direction.dart';
import 'package:qr_recipes/domain/models/recipe_information.dart';
import 'package:qr_recipes/domain/models/recipe_ingredient_group.dart';
import 'package:qr_recipes/network/entity/direction.dart';
import 'package:qr_recipes/network/entity/ingredient.dart';
import 'package:qr_recipes/network/entity/ingredinets_group.dart';
import 'package:qr_recipes/presentation/common/cache_manager.dart';
import 'package:qr_recipes/presentation/resources/strings_manager.dart';

import '../../../../services/dependencies.dart';
import '../../../domain/models/recipe_ingredient.dart';
import '../../base/api_widget/base_api_viewmodel.dart';
import '../../resources/conversion_manager.dart';

class RecipeViewModel extends BaseApiViewModel
    implements RecipeSummaryScreenViewModelFunctions {
  RecipeInformationModel? informationModel;
  List<RecipeIngredientGroupModel> ingredientsGroupsModel = [];
  List<RecipeDirectionModel> directionsModel = [];
  Function? onSuccess;

  @override
  void requestRecipe(int recipeId) {
    loading();
    DependenciesService.getDataClient().getRecipeById(recipeId).then(
      (value) {
        informationModel = RecipeInformationModel(
          '0',
          value.image!,
          value.video != null ? value.video!.file! : '',
          value.name!,
          value.time!.toString(),
          value.serving != null ? value.serving!.toString() : '0',
        );
        ingredientsGroupsModel = buildIngredients(value.ingredients!);
        directionsModel = buildDirections(value.directions!);
        if (ingredientsGroupsModel.isNotEmpty && directionsModel.isNotEmpty) {
          success();
          if (onSuccess != null) {
            onSuccess!();
          }
          viewRecipe();
        } else {
          empty();
        }
      },
    ).onError(
      (e, stackTrace) {
        AppFunctions.logException(e, stackTrace);
        failure();
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
          '${getIntegerFractionString(e.quantity!)}${getDoubleFraction(e.quantity!)}${AppStrings.units[e.unit!]![DependenciesService.getLanguageIso()]!}',
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

  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('dd-MM-yyyy');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }

  @override
  void shareRecipe() {}

  @override
  void viewRecipe() {}

  String getIntegerFractionString(double quantity) {
    int fraction = int.parse(quantity.toString().split(".")[0]);
    return fraction == 0 ? '' : '$fraction ';
  }

  String getDoubleFraction(double quantity) {
    double fraction = quantity - int.parse(quantity.toString().split(".")[0]);
    return fraction == 0 ? '' : '${AppConversion.quantityToText[fraction]} ';
  }

  @override
  void setSuccessFunction(Function successFunction) {
    onSuccess = successFunction;
  }
}

abstract class RecipeSummaryScreenViewModelFunctions {
  void requestRecipe(int recipeId);

  void shareRecipe();

  void viewRecipe();

  void setSuccessFunction(Function successFunction);
}
