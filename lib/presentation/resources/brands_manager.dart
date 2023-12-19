import 'colors_manager.dart';

const String logosPath = 'assets/brands';

class BrandsManager {
  static var brandColor = {
    'qabalan': HexColor.fromHex('#16A2A3'),
    'nabilfoods': HexColor.fromHex('#49914F'),
    'karam': HexColor.fromHex('#A03336'),
    'almarai': HexColor.fromHex('#A03336'),
    'foodccine': HexColor.fromHex('#C3424D'),
  };

  static var brandLogo = {
    'qabalan': '$logosPath/qabalan.png',
    'nabilfoods': '$logosPath/nabilfoods.png',
    'karam': '$logosPath/karam.png',
    'almarai': '$logosPath/almarai.jpg',
    'foodccine': '$logosPath/foodccine.png',
  };
}
