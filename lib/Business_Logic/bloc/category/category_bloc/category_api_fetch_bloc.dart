// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unicorn_store/Data/Repositories/category/category_respository.dart';

import '../../../../Data/Models/Category/NewCategory/category_data.dart';

part 'category_api_fetch_event.dart';
part 'category_api_fetch_state.dart';

class CategoryApiFetchBloc
    extends Bloc<CategoryApiFetchEvent, CategoryApiFetchState> {
  CategoryApiFetchBloc() : super(CategoryApiFetchInitial()) {
    final CategoryRepository categoryRepository = CategoryRepository();

    on<LoadCategoryApiFetch>((event, emit) async {
      try {
        emit(CategoryApiFetchLoading());
        final category = await categoryRepository.getCategories();
       // await Future.delayed(const Duration(seconds: 2));
        emit(CategoryApiFetchLoaded(category));
      } catch (e) {
        emit(CategoryApiFetchError(e.toString()));
      }
    });
  }
}
