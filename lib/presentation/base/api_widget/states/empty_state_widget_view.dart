import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
            Lottie.asset(
              asset,
              width: 48.sp,
              height: 48.sp,
            ),
            SizedBox(height: 20.sp),
            Text(
              text,
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
