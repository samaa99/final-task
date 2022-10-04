import 'package:final_task/screens/guest_details_screen.dart';
import 'package:flutter/material.dart';

import '../models/guest_details_model.dart';

class CustomGuestList extends StatelessWidget {
  CustomGuestList({
    required this.guests,
    Key? key,
  }) : super(key: key);

  List<GuestDetailsModel> guests;
  List<Trips> trips = [];
  List<Matches> matches = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            //print(guests[index].trips);
            trips = guests[index].trips ?? [];
            //print(trips);
            return Container(
              padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height),
                        context: context,
                        builder: (context) => GuestDetailsScreen(
                          guest: guests[index],
                        ),
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.only(bottom: 2),
                      color: Colors.grey[900],
                      shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: guests[index].img != null
                                ? ClipOval(
                                    child: Image.network(
                                    guests[index].img!,
                                    height: 70,
                                    width: 70,
                                  ))
                                : Image.asset('assets/images/profile_img.png'),
                          ),
                          title: Text(
                            '${guests[index].firstName}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: const Padding(
                            padding: EdgeInsets.only(top: 16.0),
                            child: Text(
                              'US Senitor  |  USA - P ',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Color(0xff9A9A9A),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (ctx, idx) {
                        matches = trips[idx].matches ?? [];
                        return Card(
                          margin: EdgeInsets.zero,
                          color: const Color(0xff091E0C),
                          shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 24),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Trip',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          ' .${trips[idx].status}',
                                          style: trips[idx].status == 'approved'
                                              ? const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 18,
                                                  color: Colors.green,
                                                )
                                              : const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 18,
                                                  color: Colors.redAccent,
                                                ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // trips[index].package != null ? trips[index].package!.image != null
                                        //     ? Image.network(trips[index].package!.image!)
                                        //     : Image.asset(
                                        //   'assets/images/profile_img.png',
                                        //   height: 20,
                                        //   width: 20,
                                        // ) : Image.asset(
                                        //   'assets/images/profile_img.png',
                                        //   height: 20,
                                        //   width: 20,
                                        // ),
                                        // Image.asset(
                                        //   'assets/images/profile_img.png',
                                        //   height: 20,
                                        //   width: 20,
                                        // ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '${matches[0].firstTeam}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        const Text(
                                          'Vs.',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Image.asset(
                                          'assets/images/profile_img.png',
                                          height: 20,
                                          width: 20,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '${matches[0].secondTeam}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  'assets/images/profile_img.png',
                                  height: 50,
                                  width: 50,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 2,
                        );
                      },
                      itemCount: trips.length)
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 16,
            );
          },
          itemCount: guests.length),
    );
  }
}
