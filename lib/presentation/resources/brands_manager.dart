import 'colors_manager.dart';

const String logosPath = 'assets/brands';

class BrandsManager {
  static var brandColor = {
    'qabalan_bakery': HexColor.fromHex('#16A2A3'),
    'foodccine': HexColor.fromHex('#C3424D'),
  };

  static var brandLogo = {
    'qabalan_bakery': '$logosPath/qabalan.png',
    'foodccine': '$logosPath/foodccine.png',
  };
}
