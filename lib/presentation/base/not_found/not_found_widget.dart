import 'package:flutter/material.dart';
import 'package:qr_recipes/presentation/resources/strings_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../services/dependencies.dart';
import '../../resources/assets_manager.dart';
import '../../resources/colors_manager.dart';
import '../../resources/styles_manager.dart';

class NotFoundView extends StatelessWidget {
  const NotFoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(30.sp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppBrand.brandLogo,
              width: 50.sp,
              color: Colors.grey.withOpacity(0.35),
            ),
            SizedBox(height: 15.sp),
            Text(
              AppStrings.noData[DependenciesService.getLanguageIso()]!,
              textAlign: TextAlign.center,
              style: getMediumStyle(
                      fontSize: 15.sp,
                      color: AppColors
                          .mainColor[DependenciesService.getAppStyle()]!)
                  .copyWith(height: 1.8),
            )
          ],
        ),
      ),
    );
  }
}
