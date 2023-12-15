import 'package:flutter/material.dart';
import 'package:qr_recipes/presentation/resources/brands_manager.dart';
import 'package:qr_recipes/presentation/resources/colors_manager.dart';
import 'package:qr_recipes/presentation/resources/styles_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../services/dependencies.dart';

class RecipeIngredientView extends StatefulWidget {
  const RecipeIngredientView({Key? key}) : super(key: key);

  @override
  State<RecipeIngredientView> createState() => _RecipeIngredientViewState();
}

class _RecipeIngredientViewState extends State<RecipeIngredientView> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
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
                    'هيل مطحون',
                    style: getMediumStyle(
                      fontSize: 16.sp,
                      color: AppColors
                          .mainColor[DependenciesService.getAppStyle()],
                    ),
                  ),
                  SizedBox(height: 2.sp),
                  Text(
                    '1 ملعقة كبيرة',
                    style: getMediumStyle(
                      fontSize: 14.sp,
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
                    checkColor: AppColors.white[DependenciesService.getAppStyle()]!,
                    activeColor: BrandsManager.brandColor['qabalan_bakery'],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.sp),
                    ),
                    side: BorderSide(
                      width: 4.sp,
                      color: AppColors
                          .mainColor[DependenciesService.getAppStyle()]!
                          .withOpacity(0.2),
                    ),
                    value: true,
                    onChanged: (c) {},
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
