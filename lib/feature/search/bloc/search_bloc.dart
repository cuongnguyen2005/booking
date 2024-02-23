import 'package:booking/data/hotels.dart';
import 'package:booking/source/call_api/booking_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchEvent>((event, emit) {});
    on<SearchGetHotelEvent>((event, emit) async {
      //add loading
      emit(SearchLoadingState());
      List<Hotels> curListApi = await BookingRepo.getHotels();
      List<Hotels> listByCondition = curListApi
          .where((element) => element.maDiaDiem
              .toLowerCase()
              .contains(event.widget.arg.locationCode.toLowerCase()))
          .toList();

      //delete loading
      emit(SearchDeleteLoadingState());
      if (listByCondition.isNotEmpty) {
        emit(SearchState(listHotelByCondition: listByCondition));
      } else {
        emit(SearchNoResultsState());
      }
    });
  }
}
