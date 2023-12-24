import 'package:flutter/material.dart';
import 'package:qr_recipes/domain/models/brand_product.dart';
import 'package:qr_recipes/presentation/base/not_found/not_found_widget.dart';
import 'package:qr_recipes/presentation/resources/colors_manager.dart';
import 'package:qr_recipes/presentation/resources/styles_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../services/dependencies.dart';
import '../../base/api_widget/api_widget.dart';
import '../../base/loading/loading_widget.dart';
import '../../resources/strings_manager.dart';
import '../widgets/recipe_card_widget.dart';
import '../widgets/top_bar_widget.dart';
import 'home_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.brandProduct}) : super(key: key);

  final String? brandProduct;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeScreenViewModel _viewModel = HomeScreenViewModel();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _viewModel.init(widget.brandProduct);
    _viewModel.loading();
    _viewModel.setSuccessFunction(() {
      setState(() {
        isLoading = false;
      });
    });
    _viewModel.requestProducts();
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
              Container(
                width: double.infinity,
                color: AppColors.white[DependenciesService.getAppStyle()]!,
                padding:
                    EdgeInsets.symmetric(horizontal: 13.sp, vertical: 8.sp),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors
                        .backgroundColor[DependenciesService.getAppStyle()]!,
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: DropdownButton<String?>(
                    value: _viewModel.selectedProduct,
                    items: getMenuItems(_viewModel.products),
                    onChanged: (value) {
                      setState(() {
                        _viewModel.selectedProduct = value;
                        _viewModel.requestRecipes();
                      });
                    },
                    isExpanded: true,
                    style: getMediumStyle(
                      fontSize: 15.sp,
                      color: AppColors
                          .mainColor[DependenciesService.getAppStyle()]!,
                    ),
                    underline: const SizedBox(height: 0),
                  ),
                ),
              ),
              Expanded(
                child: ApiWidget(
                    state: _viewModel.state,
                    noData: const NotFoundView(),
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

  List<DropdownMenuItem<String?>> getMenuItems(
      List<BrandProductModel> products) {
    List<DropdownMenuItem<String?>> items = [];
    for (BrandProductModel product in products) {
      items.add(DropdownMenuItem<String?>(
        value: product.identifier,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 8.sp),
            child: Text(
              product.name,
              style: getMediumStyle(
                  fontSize: 15.sp,
                  color:
                      AppColors.mainColor[DependenciesService.getAppStyle()]!),
            ),
          ),
        ),
      ));
    }
    return items;
  }
}
