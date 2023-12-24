import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../entity/brand_product.dart';
import '../entity/language.dart';
import '../entity/recipe.dart';

part 'data_client.g.dart';

//const String DOMAIN = 'data.foodccine.com';
const String DOMAIN = 'localhost:8000';
const String DEV_DOMAIN = 'dev-data.foodccine.com';

const String API_SLUG = 'api/v2/';

@RestApi(baseUrl: "http://$DOMAIN/$API_SLUG")
abstract class APIDataClient {
  factory APIDataClient(Dio dio, {String baseUrl}) = _APIDataClient;

  @GET("language/")
  Future<List<LanguageEntity>> getLanguages();

  @GET("qr/brand-product/")
  Future<List<BrandProductEntity>> getBrandProducts(
    @Query('brand_id') String brandId,
  );

  @GET("qr/recipe/{identifier}/")
  Future<RecipeEntity> getRecipeById(
    @Path('identifier') String identifier,
    @Query('brand_id') String brandId,
  );

  @GET("qr/recipe/")
  Future<List<RecipeEntity>> getRecipes(
    @Query('brand_id') String brandId,
    @Query('brand_product__identifier') String? brandProductIdentifier,
  );
}
