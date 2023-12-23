import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qr_recipes/domain/models/recipe_direction.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../services/dependencies.dart';
import '../../common/cache_manager.dart';
import '../../resources/colors_manager.dart';
import '../../resources/styles_manager.dart';

class RecipeDirectionView extends StatelessWidget {
  const RecipeDirectionView({Key? key, required this.recipeDirection})
      : super(key: key);
  final RecipeDirectionModel recipeDirection;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 9.sp),
              width: 23.sp,
              height: 23.sp,
              decoration: BoxDecoration(
                color:
                    HexColor.fromHex(DependenciesService.getBrandModel().color),
                borderRadius: BorderRadius.circular(100.sp),
              ),
              child: Center(
                child: Text(
                  recipeDirection.index.toString(),
                  style: getBoldStyle(
                          fontSize: 16.sp,
                          color: AppColors
                              .white[DependenciesService.getAppStyle()])
                      .copyWith(height: 1),
                ),
              ),
            ),
            SizedBox(width: 15.sp),
            Expanded(
              child: Text(
                recipeDirection.text,
                style: getMediumStyle(
                        fontSize: 16.5.sp,
                        color: AppColors
                            .mainColor[DependenciesService.getAppStyle()])
                    .copyWith(height: 1.8),
                textAlign: TextAlign.start,
                textDirection: TextDirection.rtl,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.sp),
        AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.sp),
            child: CachedNetworkImage(
              placeholder: (context, url) => Container(
                  color: AppColors
                      .cardBackgroundColor[DependenciesService.getAppStyle()]!),
              errorWidget: (context, url, error) => Container(
                  color: AppColors
                      .cardBackgroundColor[DependenciesService.getAppStyle()]!),
              cacheManager: AppCacheManager(),
              fadeInDuration: const Duration(milliseconds: 350),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              imageUrl: recipeDirection.image,
            ),
          ),
        ),
        SizedBox(height: 16.sp),
      ],
    );
  }
}
