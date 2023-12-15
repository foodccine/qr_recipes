import 'package:dotted_line/dotted_line.dart';
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
  final String brandId;
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
            return DottedLine(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              lineLength: double.infinity,
              lineThickness: 4.5.sp,
              dashLength: 8.sp,
              dashColor: AppColors.mainColor[DependenciesService.getAppStyle()]!
                  .withOpacity(0.2),
              dashRadius: 0,
              dashGapLength: 8.sp,
              dashGapColor: Colors.transparent,
              dashGapRadius: 0,
            );
          },
        ),
      ],
    );
  }
}
