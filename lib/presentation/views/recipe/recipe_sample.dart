import 'package:qr_recipes/domain/models/brand.dart';
import 'package:qr_recipes/domain/models/recipe_ingredient.dart';
import 'package:qr_recipes/domain/models/recipe_ingredient_group.dart';

import '../../../domain/models/recipe_information.dart';

class RecipeSample {
  static BrandModel brand = BrandModel(
    'qabalan_bakery',
    'https://qabalanbakery.com/application/assets/images/1.png',
  );

  static RecipeInformationModel recipeInformation = RecipeInformationModel(
    '340',
    'https://foodccine-data-s3-production.fra1.cdn.digitaloceanspaces.com/media/images/recipe/a0ddcf41-6dfd-46ed-9d19-7a1079afa636.jpg',
    'القطايف العصافيري بالقشطة',
    '45 دقيقة',
    '3 أشخاص',
  );
  static List<RecipeIngredientGroupModel> ingredientGroups = [
    RecipeIngredientGroupModel('مكونات تحضير القطر', [
      RecipeIngredientModel('سكر ابيض', '2 كوب'),
      RecipeIngredientModel('ماء', '1 كوب'),
      RecipeIngredientModel('عصير ليمون', '1 ملعقة صغيرة'),
      RecipeIngredientModel('ماء زهر', '1 ملعقة كبيرة'),
    ]),
    RecipeIngredientGroupModel('مكونات تحضير القشطة', [
      RecipeIngredientModel('حليب سائل', '2 كوب'),
      RecipeIngredientModel('سميد ناعم', '3 ملعقة كبيرة'),
      RecipeIngredientModel('نشا', '2 ملعقة كبيرة'),
      RecipeIngredientModel('قشطة', '170 غرام'),
      RecipeIngredientModel('سكر ابيض', '1 ملعقة كبيرة'),
    ]),
    RecipeIngredientGroupModel('مكونات اخرى', [
      RecipeIngredientModel('قطايف عصافيري', '2 باكيت'),
      RecipeIngredientModel('زبدة الفستق الحلبي', '1/2 كوب'),
      RecipeIngredientModel('فستق حلبي', '1/4 كوب'),
      RecipeIngredientModel('شوكولاتة دهن', '1/2 كوب'),
      RecipeIngredientModel('بندق', '1/4 كوب'),
    ]),
  ];
}
