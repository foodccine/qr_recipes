import 'package:flutter/material.dart';
import 'package:qr_recipes/domain/models/recipe_ingredient.dart';
import 'package:qr_recipes/presentation/resources/brands_manager.dart';
import 'package:qr_recipes/presentation/resources/colors_manager.dart';
import 'package:qr_recipes/presentation/resources/styles_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../services/dependencies.dart';

class RecipeIngredientView extends StatefulWidget {
  const RecipeIngredientView(
      {Key? key, required this.brandId, required this.ingredientModel})
      : super(key: key);
  final String? brandId;
  final RecipeIngredientModel ingredientModel;

  @override
  State<RecipeIngredientView> createState() => _RecipeIngredientViewState();
}

class _RecipeIngredientViewState extends State<RecipeIngredientView> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() {
            widget.ingredientModel.isChecked =
                !widget.ingredientModel.isChecked;
          });
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.sp),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.ingredientModel.name,
                    style: getMediumStyle(
                      fontSize: 17.sp,
                      color: AppColors
                          .mainColor[DependenciesService.getAppStyle()],
                    ),
                  ),
                  SizedBox(height: 2.sp),
                  Text(
                    widget.ingredientModel.quantity,
                    style: getMediumStyle(
                      fontSize: 15.sp,
                      color: AppColors
                          .mainColor[DependenciesService.getAppStyle()]!
                          .withOpacity(0.75),
                    ),
                  ),
                ],
              ),
              Transform.scale(
                scale: 1.4,
                child: IgnorePointer(
                  child: Checkbox(
                    checkColor:
                        AppColors.white[DependenciesService.getAppStyle()]!,
                    activeColor: BrandsManager.brandColor[widget.brandId] ??
                        BrandsManager.brandColor['foodccine'],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.sp),
                    ),
                    side: BorderSide(
                      width: 4.sp,
                      color: AppColors
                          .mainColor[DependenciesService.getAppStyle()]!
                          .withOpacity(0.2),
                    ),
                    value: widget.ingredientModel.isChecked,
                    onChanged: (bool? value) {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
