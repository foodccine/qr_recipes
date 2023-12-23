import 'social_account.dart';

class BrandModel {
  final String identifier;
  final String color;
  final String domain;
  List<SocialAccount> socialAccounts = [];

  BrandModel(this.identifier, this.color, this.domain);
}
