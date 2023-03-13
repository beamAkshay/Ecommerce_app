part of 'country_data_api_fetch_bloc.dart';

abstract class CountryDataApiFetchEvent extends Equatable {
  const CountryDataApiFetchEvent();

  @override
  List<Object> get props => [];
}


class LoadCountryDataFetchApi
    extends CountryDataApiFetchEvent {
  final String token;

  const LoadCountryDataFetchApi(this.token);

  @override
  List<Object> get props => [token];
}

