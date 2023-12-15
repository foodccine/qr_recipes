import 'package:qr_recipes/domain/models/recipe_ingredient.dart';

class RecipeIngredientGroupModel {
  final String name;
  final List<RecipeIngredientModel> ingredients;

  RecipeIngredientGroupModel(this.name, this.ingredients);
}
