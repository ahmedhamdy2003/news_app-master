import 'package:news_app/core/images_manager.dart';

class CategoryDM {
  String title;
  String id;
  String imagePath;
  CategoryDM({
    required this.title,
    required this.id,
    required this.imagePath,
  });

  static List<CategoryDM> categoriesList = [
    CategoryDM(title: 'General', id: 'general', imagePath: ImagesManager.generalLight),
    CategoryDM(title: 'Business', id: 'business', imagePath: ImagesManager.businessLight),
    CategoryDM(
        title: 'Entertainment', id: 'entertainment', imagePath: ImagesManager.entertainmentLight),
    CategoryDM(title: 'Health', id: 'health', imagePath: ImagesManager.healthLight),
    CategoryDM(title: 'Science', id: 'science', imagePath: ImagesManager.scienceLight),
    CategoryDM(title: 'Sports', id: 'sports', imagePath: ImagesManager.sportsLight),
    CategoryDM(title: 'Technology', id: 'technology', imagePath: ImagesManager.technologyLight),
  ];
}
