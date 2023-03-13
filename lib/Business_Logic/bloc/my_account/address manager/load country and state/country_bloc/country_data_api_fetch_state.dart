part of 'country_data_api_fetch_bloc.dart';

abstract class CountryDataApiFetchState extends Equatable {
  const CountryDataApiFetchState();

  @override
  List<Object> get props => [];
}

class CountryDataApiFetchInitial extends CountryDataApiFetchState {}

class CountryDataApiFetchLoading
    extends CountryDataApiFetchState {}

class CountryDataApiFetchLoded extends CountryDataApiFetchState {
  final CountryList countryList;
  const CountryDataApiFetchLoded(this.countryList);
}

class CountryDataApiFetchError
    extends CountryDataApiFetchState {
  final String? message;
  const CountryDataApiFetchError(this.message);
}

