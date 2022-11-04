import 'package:dio/dio.dart';
import 'package:meals/model/meals_modl.dart';

class Api {
  final String _endPoint = 'https://www.themealdb.com/api/json/v1/1/random.php';
  final Dio _dio = Dio();
  late Response _response;
  Future<MealsModel> getData() async {
    _response = await _dio.get(_endPoint);
    return MealsModel.fromJson(_response.data);
  }
}
