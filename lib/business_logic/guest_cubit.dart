import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/guest_details_model.dart';
import '../repository/guset_repository.dart';

part 'guest_state.dart';

class GuestCubit extends Cubit<GuestState> {
  final GuestRepository guestRepository;
  GuestCubit(this.guestRepository) : super(GuestInitial());
  List<GuestDetailsModel> guests = [];
  List<Trips> trips = [];

  List<GuestDetailsModel> getGuests() {
    guestRepository.getGuests().then((guests) {
      emit(GuestsLoaded(guests));
      this.guests = guests;
    });
    return guests;
  }

  // List<Trips> getTrips() {
  //   guestRepository.getTrips().then((trips) {
  //     emit(TripsLoaded(trips));
  //     this.trips = trips;
  //   });
  //   return trips;
  // }
}
