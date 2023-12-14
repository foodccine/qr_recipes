import 'package:json_annotation/json_annotation.dart';

part 'event_push_response.g.dart';

@JsonSerializable()
class EventPushResponse {
  @JsonKey(name: 'server_timestamp')
  final String? serverTimeStamp;

  EventPushResponse(this.serverTimeStamp);

  factory EventPushResponse.fromJson(Map<String, dynamic> json) =>
      _$EventPushResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EventPushResponseToJson(this);
}
