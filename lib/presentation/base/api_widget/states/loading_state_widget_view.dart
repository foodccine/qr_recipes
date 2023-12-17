import 'package:flutter/material.dart';
import 'package:qr_recipes/presentation/resources/colors_manager.dart';
import 'package:qr_recipes/services/dependencies.dart';

class LoadingStateWidget extends StatelessWidget {
  const LoadingStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.mainColor[DependenciesService.getAppStyle()]!
            .withOpacity(0.25),
      ),
    );
  }
}
