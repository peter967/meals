import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/controller/services/api.dart';

final provider = Provider((_) {
  return Api();
});
final mealProvider = FutureProvider((ref) async {
  return ref.watch(provider).getData();
});
