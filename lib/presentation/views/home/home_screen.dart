import 'package:flutter/material.dart';
import 'package:qr_recipes/presentation/resources/colors_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../services/dependencies.dart';
import '../../base/api_widget/api_widget.dart';
import '../../resources/strings_manager.dart';
import '../widgets/loading_widget.dart';
import '../widgets/recipe_card_widget.dart';
import '../widgets/top_bar_widget.dart';
import 'home_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeScreenViewModel _viewModel = HomeScreenViewModel();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _viewModel.loading();
    _viewModel.setSuccessFunction(() {
      setState(() {
        isLoading = false;
      });
    });
    _viewModel.requestRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white[DependenciesService.getAppStyle()]!,
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TopBarView(
                title:
                    AppStrings.homePage[DependenciesService.getLanguageIso()]!,
                action: TopBarActionType.contactUs,
                onContactPressed: () {
                  _viewModel.contactPressed(context);
                },
                showBack: false,
              ),
              Expanded(
                child: ApiWidget(
                    state: _viewModel.state,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 12.sp,
                        childAspectRatio: 1.777777777777778,
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 14.sp, vertical: 10.sp),
                      itemCount:
                          _viewModel.recipes.length, // total number of items
                      itemBuilder: (context, index) {
                        return RecipeCardView(
                          recipeInformationModel: _viewModel.recipes[index],
                          onPressed: () {
                            _viewModel.recipePressed(
                                context, _viewModel.recipes[index]);
                          },
                          onShared: () {
                            _viewModel.recipeShared(_viewModel.recipes[index]);
                          },
                        );
                      },
                    )),
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
    );
  }
}
