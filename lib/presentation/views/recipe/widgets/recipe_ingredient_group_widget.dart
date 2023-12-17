import 'package:flutter/material.dart';
import 'package:qr_recipes/domain/models/recipe_ingredient_group.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../services/dependencies.dart';
import '../../../resources/colors_manager.dart';
import '../../../resources/styles_manager.dart';
import 'recipe_ingredient_widget.dart';

class IngredientsGroupView extends StatelessWidget {
  const IngredientsGroupView(
      {Key? key, required this.brandId, required this.ingredientsGroup})
      : super(key: key);
  final String? brandId;
  final RecipeIngredientGroupModel ingredientsGroup;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ingredientsGroup.name,
          style: getBoldStyle(
            fontSize: 17.sp,
            color: AppColors.mainColor[DependenciesService.getAppStyle()],
          ).copyWith(height: 1),
        ),
        SizedBox(height: 12.sp),
        ListView.separated(
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: ingredientsGroup.ingredients.length,
          itemBuilder: (c, i) {
            return RecipeIngredientView(
                brandId: brandId,
                ingredientModel: ingredientsGroup.ingredients[i]);
          },
          separatorBuilder: (c, i) {
            return Container(
              width: double.infinity,
              height: 3.sp,
              color: AppColors.mainColor[DependenciesService.getAppStyle()]!
                  .withOpacity(0.2),
            );
          },
        ),
      ],
    );
  }
}
