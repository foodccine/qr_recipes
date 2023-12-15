import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qr_recipes/domain/models/recipe_information.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../services/dependencies.dart';
import '../../../common/cache_manager.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/brands_manager.dart';
import '../../../resources/colors_manager.dart';
import '../../../resources/styles_manager.dart';

class RecipeInformationView extends StatefulWidget {
  const RecipeInformationView(
      {Key? key, required this.brandId, required this.information})
      : super(key: key);
  final String brandId;
  final RecipeInformationModel information;

  @override
  State<RecipeInformationView> createState() => _RecipeInformationViewState();
}

class _RecipeInformationViewState extends State<RecipeInformationView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 100.w,
          height: 100.w,
          color: AppColors.primaryColor[DependenciesService.getAppStyle()],
          child: CachedNetworkImage(
            placeholder: (context, url) =>
                Image.asset(AppImages.placeHolderImage, fit: BoxFit.cover),
            errorWidget: (context, url, error) =>
                Image.asset(AppImages.placeHolderImage, fit: BoxFit.cover),
            cacheManager: AppCacheManager(),
            fadeInDuration: const Duration(milliseconds: 350),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            imageUrl: widget.information.image,
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 33.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.black[DependenciesService.getAppStyle()]!
                        .withOpacity(0.7),
                    Colors.black.withOpacity(0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Align(
                alignment: AlignmentDirectional.bottomStart,
                child: Padding(
                  padding: EdgeInsets.all(18.sp),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          widget.information.name,
                          style: getBoldStyle(
                            fontSize: 18.sp,
                            color: AppColors
                                .white[DependenciesService.getAppStyle()],
                          ).copyWith(height: 1),
                        ),
                      ),
                      SizedBox(height: 16.sp),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.sp, vertical: 8.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.sp),
                              color: AppColors
                                  .white[DependenciesService.getAppStyle()],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.access_time,
                                  color: AppColors.mainColor[
                                      DependenciesService.getAppStyle()],
                                  size: 16.sp,
                                ),
                                SizedBox(width: 10.sp),
                                Padding(
                                  padding: EdgeInsets.only(top: 7.sp),
                                  child: Text(
                                    widget.information.time,
                                    style: getMediumStyle(
                                      fontSize: 14.5.sp,
                                      color: AppColors.mainColor[
                                          DependenciesService.getAppStyle()],
                                    ).copyWith(height: 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 12.sp),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.sp, vertical: 8.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.sp),
                              color: AppColors
                                  .white[DependenciesService.getAppStyle()],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.local_dining_outlined,
                                  color: AppColors.mainColor[
                                      DependenciesService.getAppStyle()],
                                  size: 16.sp,
                                ),
                                SizedBox(width: 10.sp),
                                Padding(
                                  padding: EdgeInsets.only(top: 7.sp),
                                  child: Text(
                                    widget.information.serving,
                                    style: getMediumStyle(
                                      fontSize: 14.5.sp,
                                      color: AppColors.mainColor[
                                          DependenciesService.getAppStyle()],
                                    ).copyWith(height: 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: 32.sp,
              height: 32.sp,
              decoration: BoxDecoration(
                color: BrandsManager.brandColor[widget.brandId],
                borderRadius: BorderRadius.circular(150.sp),
                border: Border.all(
                  color: AppColors.white[DependenciesService.getAppStyle()]!,
                  width: 7.sp,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.play_arrow_rounded,
                  size: 24.sp,
                  color: AppColors.white[DependenciesService.getAppStyle()]!,
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Container(
              margin: EdgeInsets.all(14.sp),
              padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 8.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: AppColors.mainColor[DependenciesService.getAppStyle()],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.people_alt_outlined,
                    color: AppColors.white[DependenciesService.getAppStyle()],
                    size: 16.sp,
                  ),
                  SizedBox(width: 10.sp),
                  Padding(
                    padding: EdgeInsets.only(top: 7.sp),
                    child: Text(
                      widget.information.views,
                      style: getMediumStyle(
                        fontSize: 14.5.sp,
                        color:
                            AppColors.white[DependenciesService.getAppStyle()],
                      ).copyWith(height: 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            child: SizedBox(
              width: 100.w,
              height: 100.w,
            ),
            onTap: () {},
          ),
        )
      ],
    );
  }
}
