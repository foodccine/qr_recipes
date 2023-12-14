import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/settings.dart';
import '../../../../services/dependencies.dart';
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
            /*Lottie.asset(
              AppAnimations.knifeAnim,
              width: 48.sp,
              height: 48.sp,
            ),*/
            SizedBox(height: 20.sp),
            Text(
              AppStrings.error[DependenciesService.getLanguageIso() ??
                  AppSettings.defaultLanguageIso]!,
              textAlign: TextAlign.center,
              style: getRegularStyle(
                fontSize: 15.sp,
              ).copyWith(height: 6.5.sp),
            )
          ],
        ),
      ),
    );
  }
}
