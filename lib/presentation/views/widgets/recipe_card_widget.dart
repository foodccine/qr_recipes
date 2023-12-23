import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qr_recipes/domain/models/recipe_information.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/functions.dart';
import '../../../services/dependencies.dart';
import '../../common/cache_manager.dart';
import '../../resources/colors_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';

class RecipeCardView extends StatelessWidget {
  const RecipeCardView(
      {Key? key,
      required this.recipeInformationModel,
      this.brandId,
      this.onPressed,
      this.onShared})
      : super(key: key);

  final RecipeInformationModel recipeInformationModel;
  final String? brandId;
  final Function? onPressed;
  final Function? onShared;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.sp),
      child: Stack(
        children: [
          CachedNetworkImage(
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
            imageUrl: recipeInformationModel.image,
          ),
          Container(
            transform: Matrix4.translationValues(0.0, 1, 0.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.black[DependenciesService.getAppStyle()]!
                      .withOpacity(0.5),
                  Colors.black.withOpacity(0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(15.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    recipeInformationModel.name,
                    style: getMediumStyle(fontSize: 17.sp),
                  ),
                  SizedBox(height: 10.sp),
                  Row(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.access_time,
                            color: AppColors
                                .white[DependenciesService.getAppStyle()],
                            size: 16.sp,
                          ),
                          SizedBox(width: 8.sp),
                          Padding(
                            padding: EdgeInsets.only(top: 8.sp),
                            child: Text(
                              AppFunctions.minToTime(
                                  recipeInformationModel.time),
                              style: getMediumStyle(
                                fontSize: 14.5.sp,
                                color: AppColors
                                    .white[DependenciesService.getAppStyle()],
                              ).copyWith(height: 1),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 14.sp),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.local_dining_outlined,
                            color: AppColors
                                .white[DependenciesService.getAppStyle()],
                            size: 17.sp,
                          ),
                          SizedBox(width: 8.sp),
                          Padding(
                            padding: EdgeInsets.only(top: 8.sp),
                            child: Text(
                              '${recipeInformationModel.serving} ${AppStrings.person[DependenciesService.getLanguageIso()]!}',
                              style: getMediumStyle(
                                fontSize: 14.5.sp,
                                color: AppColors
                                    .white[DependenciesService.getAppStyle()],
                              ).copyWith(height: 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              if (onPressed != null) {
                onPressed!();
              }
            },
            child: Container(),
          ),
          Align(
            alignment: isRTL() ? Alignment.topLeft : Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.all(12.sp),
              child: ElevatedButton(
                onPressed: () {
                  if (onShared != null) {
                    onShared!();
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(23.sp, 23.sp),
                  shape: const CircleBorder(),
                  backgroundColor: AppColors
                      .white[DependenciesService.getAppStyle()]!
                      .withOpacity(0.3),
                ),
                child: Icon(
                  Icons.share,
                  color: AppColors.white[DependenciesService.getAppStyle()],
                  size: 16.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
