import 'package:final_task/web_services/guest_web_service.dart';

import '../models/guest_details_model.dart';

class GuestRepository {
  final GuestWebService guestWebService;
  GuestRepository(this.guestWebService);

  Future<List<GuestDetailsModel>> getGuests() async {
    final guests = await guestWebService.getGuests();
    // print('Repository');
    // print(guests.map((guest) => GuestDetailsModel.fromJson(guest)).toList());
    return guests.map((guest) => GuestDetailsModel.fromJson(guest)).toList();
  }
}
