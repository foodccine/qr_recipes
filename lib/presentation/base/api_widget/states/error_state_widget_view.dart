import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../services/dependencies.dart';
import '../../../resources/colors_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/styles_manager.dart';

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(25.sp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppStrings.error[DependenciesService.getLanguageIso()]!,
              textAlign: TextAlign.center,
              style: getMediumStyle(
                fontSize: 15.sp,
                color: AppColors.mainColor[DependenciesService.getAppStyle()]!,
              ).copyWith(height: 6.5.sp),
            )
          ],
        ),
      ),
    );
  }
}
