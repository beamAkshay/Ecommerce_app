part of 'category_api_fetch_bloc.dart';

abstract class CategoryApiFetchState extends Equatable {
  const CategoryApiFetchState();

  @override
  List<Object?> get props => [];
}

class CategoryApiFetchInitial extends CategoryApiFetchState {}

class CategoryApiFetchLoading extends CategoryApiFetchState {}

class CategoryApiFetchLoaded extends CategoryApiFetchState {
  final List<CategoryData> category;

  const CategoryApiFetchLoaded(this.category);
}

class CategoryApiFetchError extends CategoryApiFetchState {
  final String? message;
  const CategoryApiFetchError(this.message);
}
