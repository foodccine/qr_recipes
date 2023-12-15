import 'package:flutter/material.dart';
import 'package:qr_recipes/presentation/resources/strings_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../services/dependencies.dart';
import '../../../resources/colors_manager.dart';
import '../../../resources/styles_manager.dart';

class TopBarView extends StatelessWidget {
  final String logo;
  final String title;
  final Function? onSharePressed;
  const TopBarView({
    Key? key,
    required this.logo,
    required this.title,
    this.onSharePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      width: double.infinity,
      height: 31.sp,
      color: AppColors.primaryColor[DependenciesService.getAppStyle()],
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.sp),
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Image.network(logo),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10.sp),
                  onTap: () {
                    if (onSharePressed != null) {
                      onSharePressed!();
                    }
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.sp, vertical: 8.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      border: Border.all(
                          color: AppColors
                              .mainColor[DependenciesService.getAppStyle()]!),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.share,
                          color: AppColors
                              .mainColor[DependenciesService.getAppStyle()],
                          size: 16.sp,
                        ),
                        SizedBox(width: 10.sp),
                        Padding(
                          padding: EdgeInsets.only(top: 7.sp),
                          child: Text(
                            AppStrings
                                .share[DependenciesService.getLanguageIso()]!,
                            style: getMediumStyle(
                              fontSize: 14.5.sp,
                              color: AppColors
                                  .mainColor[DependenciesService.getAppStyle()],
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
                  title,
                  style: getBoldStyle(
                    fontSize: 16.sp,
                    color:
                        AppColors.mainColor[DependenciesService.getAppStyle()],
                  ).copyWith(height: 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
