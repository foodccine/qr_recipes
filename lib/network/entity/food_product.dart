import 'package:json_annotation/json_annotation.dart';

part 'food_product.g.dart';

@JsonSerializable()
class FoodProductEntity {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'image')
  final String? image;

  @JsonKey(name: 'name')
  final String? name;

  FoodProductEntity(
    this.id,
    this.image,
    this.name,
  );

  factory FoodProductEntity.fromJson(Map<String, dynamic> json) =>
      _$FoodProductEntityFromJson(json);
  Map<String, dynamic> toJson() => _$FoodProductEntityToJson(this);
}
