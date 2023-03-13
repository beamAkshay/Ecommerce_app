part of 'banner_details_bloc.dart';

abstract class BannerDetailsState extends Equatable {
  const BannerDetailsState();

  @override
  List<Object> get props => [];
}

class BannerDetailsInitial extends BannerDetailsState {}

class BannerDetailsLoading extends BannerDetailsState {}

class BannerDetailsLoded extends BannerDetailsState {
  final BannerDetails bannerDetails;
  const BannerDetailsLoded(this.bannerDetails);
}

class BannerDetailsFailure extends BannerDetailsState {
  final String message;
  const BannerDetailsFailure(this.message);
}
