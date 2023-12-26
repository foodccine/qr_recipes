import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../entity/brand_product.dart';
import '../entity/language.dart';
import '../entity/recipe.dart';

part 'data_client.g.dart';

const String DOMAIN = 'qr.foodccine.com';

const String API_SLUG = 'api/v1/';

@RestApi(baseUrl: "https://$DOMAIN/$API_SLUG")
abstract class APIDataClient {
  factory APIDataClient(Dio dio, {String baseUrl}) = _APIDataClient;

  @GET("language/")
  Future<List<LanguageEntity>> getLanguages();

  @GET("brand-product/")
  Future<List<BrandProductEntity>> getBrandProducts(
    @Query('brand_id') String brandId,
  );

  @GET("recipe/{identifier}/")
  Future<RecipeEntity> getRecipeById(
    @Path('identifier') String identifier,
    @Query('brand_id') String brandId,
  );

  @GET("recipe/")
  Future<List<RecipeEntity>> getRecipes(
    @Query('brand_id') String brandId,
    @Query('brand_product__identifier') String? brandProductIdentifier,
  );
}
