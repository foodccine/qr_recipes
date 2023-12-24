import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../services/dependencies.dart';
import '../../resources/assets_manager.dart';
import '../../resources/colors_manager.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white[DependenciesService.getAppStyle()]!,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppBrand.brandLogo,
                  width: 50.sp,
                ),
                SizedBox(height: 30.sp),
                CircularProgressIndicator(
                  color: AppColors.mainColor[DependenciesService.getAppStyle()]!
                      .withOpacity(0.25),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(25.sp),
              child: Image.asset(
                AppImages.poweredBy,
                width: 45.sp,
                color: AppColors.mainColor[DependenciesService.getAppStyle()]!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
