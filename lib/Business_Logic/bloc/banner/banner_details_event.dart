part of 'banner_details_bloc.dart';

abstract class BannerDetailsEvent extends Equatable {
  const BannerDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadBannerDetails extends BannerDetailsEvent {}
