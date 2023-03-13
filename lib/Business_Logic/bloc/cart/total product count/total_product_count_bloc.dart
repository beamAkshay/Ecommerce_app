import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Models/Cart/total_product_count.dart';
import 'package:unicorn_store/Data/Repositories/cart/add_to_cart_repository.dart';
import 'package:unicorn_store/Data/Repositories/cart/add_to_local_cart_repository.dart';

part 'total_product_count_event.dart';
part 'total_product_count_state.dart';

class TotalProductCountBloc
    extends Bloc<TotalProductCountEvent, TotalProductCountState> {
  AddToCartRepository addToCartRepository = AddToCartRepository();
  final AddToLocalCartRepository addToLocalCartRepository ;
  TotalProductCountBloc(this.addToLocalCartRepository) : super(TotalProductCountInitial()) {
    on<LoadTotalCartProductCount>((event, emit) async {
      try {
        emit(TotalProductCountLoading());
       
        if (event.isAuthenticate) {
          var totalProductCountData =
              await addToCartRepository.totalCartProductCount(event.token);
          //      print(totalProductCountData);
          if (totalProductCountData.status!) {
            emit(TotalProductCountLoaded(totalProductCountData));
          } else {
            emit(const TotalProductCountFailure("No product count found"));
          }
        } else { 
        //  await addToLocalCartRepository.init();
          var totalProductCountData =
              addToLocalCartRepository.totalLocalCartProductCount();
          //print(totalProductCountData);
            emit(TotalProductCountLoaded(TotalProductCount(status:true,message:totalProductCountData)));
       
        }
      } catch (e) {
        //   print(e);
        emit(TotalProductCountFailure(e.toString()));
      }
    });
  }
}
