// ignore_for_file: public_member_api_docs, sort_constructors_first

class MealsModel {
  final String meal;
  final String category;
  final String area;
  final String image;
  late final String youTube;
  MealsModel(
      {required this.meal,
      required this.category,
      required this.area,
      required this.image,
      required this.youTube});

  factory MealsModel.fromJson(Map<String, dynamic> json) {
    return MealsModel(
      meal: json['meals'][0]['strMeal'] as String,
      category: json['meals'][0]['strCategory'] as String,
      area: json['meals'][0]['strArea'] as String,
      image: json['meals'][0]['strMealThumb'] as String,
      youTube: json['meals'][0]['strYoutube'],
    );
  }
}
