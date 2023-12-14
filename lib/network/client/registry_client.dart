import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../entity/registry.dart';

part 'registry_client.g.dart';

const String DOMAIN = 'api.ipregistry.co';
const String API_KEY = 'jnuzrm9iuk008v0a';

@RestApi(baseUrl: "https://$DOMAIN?key=$API_KEY")
abstract class APIRegistryClient {
  factory APIRegistryClient(Dio dio, {String baseUrl}) = _APIRegistryClient;

  @GET("")
  Future<Registry> getUserRegistry();
}
