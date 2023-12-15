import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../services/dependencies.dart';
import '../../common/cache_manager.dart';
import '../../resources/assets_manager.dart';
import '../../resources/brands_manager.dart';
import '../../resources/colors_manager.dart';
import '../../resources/styles_manager.dart';
import 'recipe_ingredient_widget.dart';

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
          Container(
            padding: EdgeInsets.all(10.sp),
            width: double.infinity,
            height: 29.sp,
            color: AppColors.primaryColor[DependenciesService.getAppStyle()],
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.sp),
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Image.network(
                        'https://qabalanbakery.com/application/assets/images/1.png'),
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10.sp),
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.sp, vertical: 8.sp),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            border: Border.all(
                                color: AppColors.mainColor[
                                    DependenciesService.getAppStyle()]!),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.share,
                                color: AppColors.mainColor[
                                    DependenciesService.getAppStyle()],
                                size: 16.sp,
                              ),
                              SizedBox(width: 10.sp),
                              Padding(
                                padding: EdgeInsets.only(top: 7.sp),
                                child: Text(
                                  'مشاركة',
                                  style: getMediumStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.mainColor[
                                        DependenciesService.getAppStyle()],
                                  ).copyWith(height: 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: 7.sp),
                      child: Text(
                        'تفاصيل الوصفة',
                        style: getBoldStyle(
                          fontSize: 15.5.sp,
                          color: AppColors
                              .mainColor[DependenciesService.getAppStyle()],
                        ).copyWith(height: 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      children: [
                        Container(
                          width: 100.w,
                          height: 100.w,
                          color: AppColors
                              .primaryColor[DependenciesService.getAppStyle()],
                          child: CachedNetworkImage(
                            placeholder: (context, url) => Image.asset(
                                AppImages.placeHolderImage,
                                fit: BoxFit.cover),
                            errorWidget: (context, url, error) => Image.asset(
                                AppImages.placeHolderImage,
                                fit: BoxFit.cover),
                            cacheManager: AppCacheManager(),
                            fadeInDuration: const Duration(milliseconds: 350),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                            imageUrl:
                                'https://www.miops.com/cdn/shop/articles/Food_Photography___How_to_Take_Unique_and_Creative_Food_Photos_5.jpg?v=1661150733',
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
                                    AppColors.black[
                                            DependenciesService.getAppStyle()]!
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
                                  child: Text(
                                    'طريقة عمل التاجينة العراقية',
                                    style: getBoldStyle(
                                      fontSize: 17.sp,
                                      color: AppColors.white[
                                          DependenciesService.getAppStyle()],
                                    ).copyWith(height: 1),
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
                                color:
                                    BrandsManager.brandColor['qabalan_bakery'],
                                borderRadius: BorderRadius.circular(150.sp),
                                border: Border.all(
                                  color: AppColors.white[
                                      DependenciesService.getAppStyle()]!,
                                  width: 7.sp,
                                ),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.play_arrow_rounded,
                                  size: 24.sp,
                                  color: AppColors.white[
                                      DependenciesService.getAppStyle()]!,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18.sp),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.sp),
                      color: AppColors.cardBackgroundColor[
                          DependenciesService.getAppStyle()],
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 18.sp),
                    padding:
                        EdgeInsets.only(top: 20.sp, left: 18.sp, right: 18.sp),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'مكونات تحضير البهارات',
                          style: getBoldStyle(
                            fontSize: 16.sp,
                            color: AppColors
                                .mainColor[DependenciesService.getAppStyle()],
                          ).copyWith(height: 1),
                        ),
                        SizedBox(height: 12.sp),
                        ListView.separated(
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (c, i) {
                            return const RecipeIngredientView();
                          },
                          separatorBuilder: (c, i) {
                            return DottedLine(
                              direction: Axis.horizontal,
                              alignment: WrapAlignment.center,
                              lineLength: double.infinity,
                              lineThickness: 4.5.sp,
                              dashLength: 8.sp,
                              dashColor: AppColors
                                  .mainColor[DependenciesService.getAppStyle()]!
                                  .withOpacity(0.2),
                              dashRadius: 0,
                              dashGapLength: 8.sp,
                              dashGapColor: Colors.transparent,
                              dashGapRadius: 0,
                            );
                          },
                        ),
                        SizedBox(height: 20.sp),
                        Text(
                          'مكونات تحضير البهارات',
                          style: getBoldStyle(
                            fontSize: 16.sp,
                            color: AppColors
                                .mainColor[DependenciesService.getAppStyle()],
                          ).copyWith(height: 1),
                        ),
                        SizedBox(height: 12.sp),
                        ListView.separated(
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (c, i) {
                            return const RecipeIngredientView();
                          },
                          separatorBuilder: (c, i) {
                            return DottedLine(
                              direction: Axis.horizontal,
                              alignment: WrapAlignment.center,
                              lineLength: double.infinity,
                              lineThickness: 4.5.sp,
                              dashLength: 8.sp,
                              dashColor: AppColors
                                  .mainColor[DependenciesService.getAppStyle()]!
                                  .withOpacity(0.2),
                              dashRadius: 0,
                              dashGapLength: 8.sp,
                              dashGapColor: Colors.transparent,
                              dashGapRadius: 0,
                            );
                          },
                        ),
                      ],
                    ),
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
