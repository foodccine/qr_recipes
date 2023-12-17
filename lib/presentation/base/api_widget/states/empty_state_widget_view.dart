import 'package:flutter/material.dart';
import 'package:qr_recipes/services/dependencies.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../resources/colors_manager.dart';
import '../../../resources/styles_manager.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({Key? key, required this.text, required this.asset})
      : super(key: key);

  final String text;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(25.sp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: getMediumStyle(
                      fontSize: 15.sp,
                      color: AppColors
                          .mainColor[DependenciesService.getAppStyle()]!)
                  .copyWith(height: 6.5.sp),
            )
          ],
        ),
      ),
    );
  }
}
