import 'package:unicorn_store/Data/Data_Providers/Category/category_service_api.dart';
import '../../Models/Category/NewCategory/category_data.dart';

class CategoryRepository {
  final _categoryServiceApi = CategoryServiceApi();
  Future<List<CategoryData>> getCategories() {
    return _categoryServiceApi.getCategories();
  }
}
