import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../network/response/event_push_response.dart';
import '../body/event.dart';

part 'big_data_client.g.dart';

//const String DOMAIN = '192.168.1.134:8000';
const String DOMAIN = 'bigdata.foodccine.com';
const String DEV_DOMAIN = 'dev-bigdata.foodccine.com';
const String API_SLUG = 'api/v1/';

@RestApi(baseUrl: "https://$DOMAIN/$API_SLUG")
abstract class APIBigDataClient {
  factory APIBigDataClient(Dio dio, {String baseUrl}) = _APIBigDataClient;

  @POST("event/")
  Future<EventPushResponse> sendEvent(@Body() Event body);
}
