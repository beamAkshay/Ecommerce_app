import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unicorn_store/Data/Models/banner/banner_details.dart';

part 'banner_details_event.dart';
part 'banner_details_state.dart';

class BannerDetailsBloc extends Bloc<BannerDetailsEvent, BannerDetailsState> {
  BannerDetailsBloc() : super(BannerDetailsInitial()) {
    on<BannerDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
