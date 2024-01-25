import 'package:booking/data/hotels.dart';
import 'package:booking/source/call_api/booking_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<HomeGetHotelsList>((event, emit) async {
      List<Hotels> curHotelsList = await BookingRepo.getHotels();
      emit(HomeState(hotelsList: curHotelsList));
    });
  }
}
