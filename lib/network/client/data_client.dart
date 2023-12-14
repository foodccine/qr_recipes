import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../body/feedback_message.dart';
import '../entity/language.dart';
import '../entity/privacy_policy.dart';

part 'data_client.g.dart';

const String DOMAIN = 'data.foodccine.com';
const String DEV_DOMAIN = 'dev-data.foodccine.com';

const String API_SLUG = 'api/v2/';

@RestApi(baseUrl: "https://$DOMAIN/$API_SLUG")
abstract class APIDataClient {
  factory APIDataClient(Dio dio, {String baseUrl}) = _APIDataClient;

  @GET("language/")
  Future<List<LanguageEntity>> getLanguages();

  @POST("feedback/")
  Future sendFeedbackMessage(@Body() FeedbackBody body);

  @GET("privacy-policy/")
  Future<List<PrivacyPolicyEntity>> getPrivacyPolicy();
}
