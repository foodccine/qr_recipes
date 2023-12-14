import 'package:json_annotation/json_annotation.dart';

part 'registry.g.dart';

@JsonSerializable()
class Company {
  final String? domain;
  final String? name;
  final String? type;

  Company(this.domain, this.name, this.type);

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}

@JsonSerializable()
class Flag {
  final String? emoji;
  final String? emoji_unicode;
  final String? twemoji;
  final String? wikimedia;

  Flag(this.emoji, this.emoji_unicode, this.twemoji, this.wikimedia);

  factory Flag.fromJson(Map<String, dynamic> json) => _$FlagFromJson(json);

  Map<String, dynamic> toJson() => _$FlagToJson(this);
}

@JsonSerializable()
class Country {
  final String? name;
  final String? code;
  final int? population;
  final String? calling_code;
  final Flag? flag;

  Country(this.name, this.code, this.population, this.calling_code, this.flag);

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

@JsonSerializable()
class Location {
  final String? city;
  final Country? country;

  Location(this.city, this.country);

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Device {
  final String? brand;
  final String? name;
  final String? type;

  Device(this.brand, this.name, this.type);

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceToJson(this);
}

@JsonSerializable()
class Os {
  final String? name;
  final String? type;
  final String? version;

  Os(this.name, this.type, this.version);

  factory Os.fromJson(Map<String, dynamic> json) => _$OsFromJson(json);

  Map<String, dynamic> toJson() => _$OsToJson(this);
}

@JsonSerializable()
class UserAgent {
  final String? header;
  final Device? device;
  final Os? os;

  UserAgent(this.header, this.device, this.os);

  factory UserAgent.fromJson(Map<String, dynamic> json) =>
      _$UserAgentFromJson(json);

  Map<String, dynamic> toJson() => _$UserAgentToJson(this);
}

@JsonSerializable()
class Registry {
  final String? ip;

  final Company? company;

  final Location? location;

  final UserAgent? user_agent;

  Registry(this.ip, this.company, this.location, this.user_agent);

  factory Registry.fromJson(Map<String, dynamic> json) =>
      _$RegistryFromJson(json);

  Map<String, dynamic> toJson() => _$RegistryToJson(this);
}
