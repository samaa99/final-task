part of 'guest_cubit.dart';

@immutable
class GuestState {}

class GuestInitial extends GuestState {}

class GuestsLoaded extends GuestState {
  final List<GuestDetailsModel> guests;
  GuestsLoaded(this.guests);
}


