import 'package:flutter/material.dart';

import '../../../presentation/base/api_widget/states/error_state_widget_view.dart';
import '../../../presentation/base/api_widget/states/loading_state_widget_view.dart';
import '../../../services/dependencies.dart';
import '../../base/api_widget/states/empty_state_widget_view.dart';
import '../../resources/strings_manager.dart';

class ApiWidget extends StatelessWidget {
  final ApiWidgetState? state;
  final Widget child;
  final Widget loading;
  Widget? noData;
  final Widget error;

  ApiWidget(
      {Key? key,
      required this.state,
      required this.child,
      this.loading = const LoadingStateWidget(),
      this.noData,
      this.error = const ErrorStateWidget()})
      : super(key: key);

  /*const EmptyStateWidget(
  text: AppStrings.noData_dict[getLanguageIso() ?? 'en'],
  asset: AppAnimations.microwaveAnim,
  ),*/

  @override
  Widget build(BuildContext context) {
    noData ??= EmptyStateWidget(
      text: AppStrings.noData[DependenciesService.getLanguageIso()]!,
      asset: '',
    );
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      child: getActiveWidget(),
    );
  }

  Widget getActiveWidget() {
    switch (state) {
      case ApiWidgetState.loading:
        return loading;
      case ApiWidgetState.empty:
        return noData!;
      case ApiWidgetState.success:
        return child;
      case ApiWidgetState.failure:
        return error;
      default:
        return loading;
    }
  }
}

enum ApiWidgetState { success, loading, empty, failure }
