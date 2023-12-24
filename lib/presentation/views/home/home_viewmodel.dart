import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_recipes/app/settings.dart';
import 'package:qr_recipes/domain/models/brand_product.dart';
import 'package:qr_recipes/domain/models/social_account.dart';
import 'package:qr_recipes/network/entity/brand_product.dart';
import 'package:qr_recipes/network/entity/recipe.dart';
import 'package:qr_recipes/presentation/resources/colors_manager.dart';
import 'package:qr_recipes/presentation/views/widgets/social_media_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';

import '../../../domain/models/recipe_information.dart';
import '../../../services/dependencies.dart';
import '../../base/api_widget/base_api_viewmodel.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';

class HomeScreenViewModel extends BaseApiViewModel
    implements HomeScreenViewModelFunctions {
  String? selectedProduct;
  String? queryParam;
  Function? onSuccess;
  final List<RecipeInformationModel> recipes = [];
  final List<BrandProductModel> products = [];

  @override
  void init(String? selectedProduct) {
    queryParam = selectedProduct;
  }

  @override
  void requestProducts() {
    products.clear();
    products.add(BrandProductModel(
      -1,
      null,
      'جميع المنتجات',
      '',
    ));
    loading();
    DependenciesService.getDataClient()
        .getBrandProducts(DependenciesService.getBrandModel().identifier)
        .then((value) {
      for (BrandProductEntity entity in value) {
        products.add(BrandProductModel(
          entity.id ?? 0,
          entity.identifier,
          entity.name ?? '',
          entity.image ?? '',
        ));
      }
      validateSelectedProduct();
      requestRecipes();
    }).onError((error, stackTrace) {
      validateSelectedProduct();
      requestRecipes();
    });
  }

  @override
  void requestRecipes() {
    loading();
    DependenciesService.getDataClient()
        .getRecipes(
            DependenciesService.getBrandModel().identifier, selectedProduct)
        .then((value) {
      recipes.clear();
      for (RecipeEntity recipe in value) {
        recipes.add(RecipeInformationModel(
          recipe.id ?? 0,
          recipe.identifier ?? '',
          0,
          recipe.image ?? '',
          '',
          recipe.name ?? '',
          recipe.time ?? 0,
          recipe.serving ?? 0,
        ));
      }
      if (recipes.isNotEmpty) {
        success();
        if (onSuccess != null) {
          onSuccess!();
        }
      } else {
        empty();
      }
    }).onError(
      (e, stackTrace) {
        empty();
      },
    );
  }

  void validateSelectedProduct() {
    bool isSelectedProductExists = false;
    for (BrandProductModel p in products) {
      if (p.identifier == queryParam) {
        isSelectedProductExists = true;
      }
    }
    if (!isSelectedProductExists) {
      selectedProduct = null;
    } else {
      selectedProduct = queryParam;
    }
  }

  @override
  void setSuccessFunction(Function successFunction) {
    onSuccess = successFunction;
  }

  @override
  void recipePressed(BuildContext context, RecipeInformationModel recipe) {
    context.go('/${AppKeys.recipePath}/${recipe.identifier}');
  }

  @override
  void recipeShared(RecipeInformationModel recipe) {
    Share.share(
        '${recipe.name}: ${DependenciesService.getBrandModel().domain}${AppKeys.recipePath}/${recipe.id}');
  }

  @override
  void contactPressed(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: AppColors.white[DependenciesService.getAppStyle()]!,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Directionality(
            textDirection: getLayoutDirection(),
            child: Wrap(
              children: getSocialAccounts(
                  context, DependenciesService.getBrandModel().socialAccounts),
            ),
          );
        });
  }

  List<Widget> getSocialAccounts(
      BuildContext context, List<SocialAccount> accounts) {
    List<Widget> children = [];
    children.add(Padding(
      padding: EdgeInsets.all(10.sp),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 6.sp),
              child: Text(
                  AppStrings.contactUs[DependenciesService.getLanguageIso()]!,
                  style: getBoldStyle(
                    fontSize: 16.sp,
                    color:
                        AppColors.mainColor[DependenciesService.getAppStyle()],
                  )),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.close,
                  color: AppColors.mainColor[DependenciesService.getAppStyle()]!
                      .withOpacity(0.75),
                  size: 18.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
    for (SocialAccount account in accounts) {
      children.add(SocialMediaWidget(
        platform: account.platform,
        username: account.username,
        target: account.target,
      ));
    }
    return children;
  }

  TextDirection getLayoutDirection() {
    if (DependenciesService.getLanguageDirection() != null) {
      if (DependenciesService.getLanguageDirection() == 'rtl') {
        return TextDirection.rtl;
      } else if (DependenciesService.getLanguageDirection() == 'ltr') {
        return TextDirection.ltr;
      } else {
        return AppSettings.defaultLanguageDirection;
      }
    } else {
      return AppSettings.defaultLanguageDirection;
    }
  }
}

abstract class HomeScreenViewModelFunctions {
  void init(String? selectedProduct);
  void requestRecipes();
  void requestProducts();
  void setSuccessFunction(Function successFunction);
  void recipePressed(BuildContext context, RecipeInformationModel recipe);
  void recipeShared(RecipeInformationModel recipe);
  void contactPressed(BuildContext context);
}
