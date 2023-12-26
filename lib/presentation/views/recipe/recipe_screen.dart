import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_recipes/presentation/base/api_widget/api_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stacked/stacked.dart';

import '../../../services/dependencies.dart';
import '../../base/loading/loading_widget.dart';
import '../../base/not_found/not_found_widget.dart';
import '../../resources/colors_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import '../widgets/recipe_direction_widget.dart';
import '../widgets/recipe_info_widget.dart';
import '../widgets/recipe_ingredient_group_widget.dart';
import '../widgets/top_bar_widget.dart';
import 'recipe_viewmodel.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({
    Key? key,
    required this.identifier,
  }) : super(key: key);
  final String identifier;

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  final RecipeScreenViewModel _viewModel = RecipeScreenViewModel();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _viewModel.loading();
    _viewModel.setSuccessFunction(() {
      setState(() {
        isLoading = false;
      });
    });
    _viewModel.requestRecipe(widget.identifier);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RecipeScreenViewModel>.reactive(
      viewModelBuilder: () => _viewModel,
      builder: (context, viewModel, child) => Scaffold(
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TopBarView(
                  title: AppStrings
                      .recipeDetails[DependenciesService.getLanguageIso()]!,
                  action: TopBarActionType.share,
                  onSharePressed: () {
                    _viewModel.shareRecipe();
                  },
                  onBackPressed: () {
                    context.go('/');
                  },
                  showBack: true,
                ),
                Container(
                    width: double.infinity,
                    height: 4.sp,
                    color: AppColors
                        .mainColor[DependenciesService.getAppStyle()]!
                        .withOpacity(0.1)),
                Expanded(
                  child: ApiWidget(
                    state: _viewModel.state,
                    noData: const NotFoundView(),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (_viewModel.informationModel != null)
                            RecipeInformationView(
                              information: _viewModel.informationModel!,
                            ),
                          SizedBox(height: 18.sp),
                          ListView.separated(
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _viewModel.ingredientsGroupsModel.length,
                            itemBuilder: (c, i) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14.sp),
                                  color: AppColors.cardBackgroundColor[
                                      DependenciesService.getAppStyle()],
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 18.sp),
                                padding: EdgeInsets.only(
                                    top: 20.sp, left: 18.sp, right: 18.sp),
                                child: IngredientsGroupView(
                                  ingredientsGroup:
                                      _viewModel.ingredientsGroupsModel[i],
                                ),
                              );
                            },
                            separatorBuilder: (c, i) {
                              return SizedBox(height: 15.sp);
                            },
                          ),
                          SizedBox(height: 18.sp),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.sp),
                              color: AppColors.cardBackgroundColor[
                                  DependenciesService.getAppStyle()],
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 18.sp),
                            padding: EdgeInsets.only(
                                top: 20.sp, left: 18.sp, right: 18.sp),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.recipeDirection[
                                      DependenciesService.getLanguageIso()]!,
                                  style: getBoldStyle(
                                    fontSize: 17.sp,
                                    color: AppColors.mainColor[
                                        DependenciesService.getAppStyle()],
                                  ).copyWith(height: 1),
                                ),
                                SizedBox(height: 18.sp),
                                ListView.separated(
                                  scrollDirection: Axis.vertical,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: _viewModel.directionsModel.length,
                                  itemBuilder: (c, i) {
                                    return RecipeDirectionView(
                                      recipeDirection:
                                          _viewModel.directionsModel[i],
                                    );
                                  },
                                  separatorBuilder: (c, i) {
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 14.sp),
                                      child: Container(
                                        width: double.infinity,
                                        height: 3.sp,
                                        color: AppColors.mainColor[
                                                DependenciesService
                                                    .getAppStyle()]!
                                            .withOpacity(0.2),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            IgnorePointer(
              child: AnimatedOpacity(
                opacity: isLoading ? 1 : 0,
                duration: const Duration(milliseconds: 500),
                child: const LoadingView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
