import 'package:qr_recipes/domain/models/recipe_direction.dart';
import 'package:qr_recipes/domain/models/recipe_ingredient.dart';
import 'package:qr_recipes/domain/models/recipe_ingredient_group.dart';

import '../../../domain/models/recipe_information.dart';

class RecipeSample {
  static RecipeInformationModel recipeInformation = RecipeInformationModel(
    '340',
    'https://foodccine-data-s3-production.fra1.cdn.digitaloceanspaces.com/media/images/recipe/a0ddcf41-6dfd-46ed-9d19-7a1079afa636.jpg',
    'https://foodccine-data-s3-production.fra1.cdn.digitaloceanspaces.com/media/videos/recipe/bd6acd10-fb11-408b-a014-189f234930a8.mp4',
    'القطايف العصافيري بالقشطة',
    '45 دقيقة',
    '3 أشخاص',
  );
  static List<RecipeIngredientGroupModel> ingredientGroups = [
    RecipeIngredientGroupModel('مكونات تحضير القطر', [
      RecipeIngredientModel('سكر ابيض', '2 كوب'),
      RecipeIngredientModel('ماء', '1 كوب'),
      RecipeIngredientModel('عصير ليمون', '1 ملعقة صغيرة'),
      RecipeIngredientModel('ماء زهر', '1 ملعقة كبيرة'),
    ]),
    RecipeIngredientGroupModel('مكونات تحضير القشطة', [
      RecipeIngredientModel('حليب سائل', '2 كوب'),
      RecipeIngredientModel('سميد ناعم', '3 ملعقة كبيرة'),
      RecipeIngredientModel('نشا', '2 ملعقة كبيرة'),
      RecipeIngredientModel('قشطة', '170 غرام'),
      RecipeIngredientModel('سكر ابيض', '1 ملعقة كبيرة'),
    ]),
    RecipeIngredientGroupModel('مكونات اخرى', [
      RecipeIngredientModel('قطايف عصافيري', '2 باكيت'),
      RecipeIngredientModel('زبدة الفستق الحلبي', '1/2 كوب'),
      RecipeIngredientModel('فستق حلبي', '1/4 كوب'),
      RecipeIngredientModel('شوكولاتة دهن', '1/2 كوب'),
      RecipeIngredientModel('بندق', '1/4 كوب'),
    ]),
  ];

  static List<RecipeDirectionModel> recipeDirections = [
    RecipeDirectionModel(1, 'في قدر على النار نضيف السكر والماء',
        'https://foodccine-data-s3-production.fra1.cdn.digitaloceanspaces.com/media/images/recipe/direction/9c817a51-8cda-429d-9710-14d33e06b52c.jpg'),
    RecipeDirectionModel(2, 'نتركه حتى يبدأ بالغليان على نار عالية',
        'https://foodccine-data-s3-production.fra1.cdn.digitaloceanspaces.com/media/images/recipe/direction/e437496a-8789-4222-9843-32db8fbd4d96.jpg'),
    RecipeDirectionModel(3, 'بعد الغليان نضيف عصير الليمون',
        'https://foodccine-data-s3-production.fra1.cdn.digitaloceanspaces.com/media/images/recipe/direction/2ab12d0b-dddd-4228-bca7-b1778661f746.jpg'),
    RecipeDirectionModel(4, 'نتركها لمدة ١٠ دقائق على نار هادئة',
        'https://foodccine-data-s3-production.fra1.cdn.digitaloceanspaces.com/media/images/recipe/direction/275c8041-5200-4e7e-9eb3-3e07302aa1da.jpg'),
    RecipeDirectionModel(5, 'بعد مرور ١٠ دقائق نضيف ماء الزهر (اختياري)',
        'https://foodccine-data-s3-production.fra1.cdn.digitaloceanspaces.com/media/images/recipe/direction/ed1a13f3-4c43-4b92-bdbb-b1fcc8ed8b9b.jpg'),
    RecipeDirectionModel(6, 'نرفعه عن النار ونتركه يبرد بدرجة حرارة الغرفة',
        'https://foodccine-data-s3-production.fra1.cdn.digitaloceanspaces.com/media/images/recipe/direction/09fdbc52-a7c9-4f29-b8d5-e6acb6430cd5.jpg'),
    RecipeDirectionModel(
        7,
        'في قدر نضيف جميع مكونات القشطة (مع مراعاة أن يكون الحليب بدرجة حرارة الغرفة)',
        'https://foodccine-data-s3-production.fra1.cdn.digitaloceanspaces.com/media/images/recipe/direction/c2ffc322-2a21-4d48-a115-613597c65b1b.jpg'),
    RecipeDirectionModel(8, 'نخلط المكونات جيداً بدون حرارة',
        'https://foodccine-data-s3-production.fra1.cdn.digitaloceanspaces.com/media/images/recipe/direction/08f01d39-2941-494f-9dca-7ddcf443f36a.jpg'),
    RecipeDirectionModel(
        9,
        'نضع القدر على النار ونستمر بالتحريك حتى يثقل الخليط',
        'https://foodccine-data-s3-production.fra1.cdn.digitaloceanspaces.com/media/images/recipe/direction/06038c29-de66-4fe8-a500-04ec0d42638a.jpg'),
    RecipeDirectionModel(10, 'نغطيها ونتركها تبرد بدرجة حرارة الغرفة',
        'https://foodccine-data-s3-production.fra1.cdn.digitaloceanspaces.com/media/images/recipe/direction/21ccb0c7-cf88-4126-bdd7-723b01afb8d3.jpg'),
    RecipeDirectionModel(
        11,
        'بعد مرور الوقت على تبريد القشطة نخلطها جيداً حتى تصبح ناعمة  (يمكن وضع الخليط في كيس حلواني لسهولة الاستخدام)',
        'https://foodccine-data-s3-production.fra1.cdn.digitaloceanspaces.com/media/images/recipe/direction/527e2a1b-d7de-4f8f-9571-5be00ad2df4d.jpg'),
    RecipeDirectionModel(12, 'قطايف عصافيري (ينصح باستخدام قطايف قبلان)',
        'https://foodccine-data-s3-production.fra1.cdn.digitaloceanspaces.com/media/images/recipe/direction/aaae9b76-b6f5-4dd0-bf0e-3f52942ab4d1.jpg'),
    RecipeDirectionModel(
        13,
        'نشكل حبات القطايف (مع مراعاة اغلاق اطراف القطايف الى النصف)',
        'https://foodccine-data-s3-production.fra1.cdn.digitaloceanspaces.com/media/images/recipe/direction/b06781d3-b457-498d-ac1e-27fb29253133.jpg'),
    RecipeDirectionModel(14, 'نغطس القطايف بزبدة الفستق الحلبي (اختياري)',
        'https://foodccine-data-s3-production.fra1.cdn.digitaloceanspaces.com/media/images/recipe/direction/45aeb063-7ec9-4047-a2ec-a708b83bdcb5.jpg'),
    RecipeDirectionModel(15, 'ثم نغطيها بالفستق الحلبي المطحون (اختياري)',
        'https://foodccine-data-s3-production.fra1.cdn.digitaloceanspaces.com/media/images/recipe/direction/f1820bda-0875-4fef-a349-8e51d1d7e1cb.jpg'),
    RecipeDirectionModel(16, 'نغطس القطايف بشوكلاته الدهن (اختياري)',
        'https://foodccine-data-s3-production.fra1.cdn.digitaloceanspaces.com/media/images/recipe/direction/b2155c4c-3801-49d3-ac94-9b031584c219.jpg'),
    RecipeDirectionModel(17, 'ثم نغطيها بالبندق المطحون (اختياري)',
        'https://foodccine-data-s3-production.fra1.cdn.digitaloceanspaces.com/media/images/recipe/direction/3688d31e-bea5-475f-b075-8e5c0c1ad4b9.jpg'),
    RecipeDirectionModel(18, 'نضيف القشطة داخل القطايف',
        'https://foodccine-data-s3-production.fra1.cdn.digitaloceanspaces.com/media/images/recipe/direction/58fd2f41-c971-4289-aaa3-75a4a6be8216.jpg'),
    RecipeDirectionModel(19, 'تزين بالورد المحمدي (اختياري)',
        'https://foodccine-data-s3-production.fra1.cdn.digitaloceanspaces.com/media/images/recipe/direction/7ca95671-bd51-4064-9e8b-66d2b75ef7a4.jpg'),
    RecipeDirectionModel(20, 'نضيف القطر (اختياري)',
        'https://foodccine-data-s3-production.fra1.cdn.digitaloceanspaces.com/media/images/recipe/direction/0eeacd2c-3484-4533-9d12-b686478ee1ed.jpg'),
    RecipeDirectionModel(21, 'تقدم مباشرة',
        'https://foodccine-data-s3-production.fra1.cdn.digitaloceanspaces.com/media/images/recipe/direction/a123e8b5-3a17-4618-9690-6d9045ab8bb4.jpg'),
  ];
}
