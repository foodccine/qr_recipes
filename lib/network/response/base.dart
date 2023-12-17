import 'package:json_annotation/json_annotation.dart';

part 'base.g.dart';

@JsonSerializable()
class PaginationResponse {
  final int? count;
  final String? next;
  final String? previous;

  PaginationResponse(this.count, this.next, this.previous);

  factory PaginationResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationResponseToJson(this);
}
