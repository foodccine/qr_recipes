import 'package:flutter/material.dart';
import 'package:qr_recipes/presentation/views/recipe/recipe_sample.dart';
import 'package:qr_recipes/presentation/views/recipe/widgets/recipe_info_widget.dart';
import 'package:qr_recipes/presentation/views/recipe/widgets/recipe_ingredient_group_widget.dart';
import 'package:qr_recipes/presentation/views/recipe/widgets/top_bar_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../services/dependencies.dart';
import '../../resources/colors_manager.dart';
import '../../resources/strings_manager.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TopBarView(
            logo: RecipeSample.brand.brandLogo,
            title:
                AppStrings.recipeDetails[DependenciesService.getLanguageIso()]!,
            onSharePressed: () {},
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RecipeInformationView(
                    brandId: RecipeSample.brand.brandId,
                    information: RecipeSample.recipeInformation,
                  ),
                  SizedBox(height: 18.sp),
                  ListView.separated(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: RecipeSample.ingredientGroups.length,
                    itemBuilder: (c, i) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.sp),
                          color: AppColors.cardBackgroundColor[
                              DependenciesService.getAppStyle()],
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 18.sp),
                        padding: EdgeInsets.only(
                            top: 20.sp, left: 18.sp, right: 18.sp),
                        child: IngredientsGroupView(
                          brandId: RecipeSample.brand.brandId,
                          ingredientsGroup: RecipeSample.ingredientGroups[i],
                        ),
                      );
                    },
                    separatorBuilder: (c, i) {
                      return SizedBox(height: 15.sp);
                    },
                  ),
                  SizedBox(height: 18.sp),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
