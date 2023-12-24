import 'package:json_annotation/json_annotation.dart';

part 'brand_product.g.dart';

@JsonSerializable()
class BrandProductEntity {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'identifier')
  final String? identifier;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'image')
  final String? image;

  BrandProductEntity(
    this.id,
    this.identifier,
    this.name,
    this.image,
  );

  factory BrandProductEntity.fromJson(Map<String, dynamic> json) =>
      _$BrandProductEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BrandProductEntityToJson(this);
}
