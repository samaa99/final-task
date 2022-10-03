import 'package:final_task/business_logic/guest_cubit.dart';
import 'package:final_task/models/guest_details_model.dart';
import 'package:final_task/repository/guset_repository.dart';
import 'package:final_task/screens/create_user_screen.dart';
import 'package:final_task/web_services/guest_web_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../constants.dart';

class GuestDetailsScreen extends StatelessWidget {
  GuestDetailsScreen({required this.guest, Key? key}) : super(key: key);
  final GuestDetailsModel guest;

  //List<TripsModel> trips = [];
  List<Trips> trips = [];
  List<Matches> matches = [];

  // Widget _buildLoading() {
  //   return Center(
  //     child: CircularProgressIndicator(
  //       color: Colors.grey,
  //     ),
  //   );
  // }

  Widget createActionMenu(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        padding: EdgeInsets.all(16),
        height: 300,
        width: 600,
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Choose Action',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateNewGuest()));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: const Text(
                'Edit Guest',
                style: TextStyle(color: Colors.blue, fontSize: 18),
              ),
            ),
            const Divider(
              height: 2,
              color: Colors.grey,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: const Text(
                'Add Trip',
                style: TextStyle(color: Colors.blue, fontSize: 18),
              ),
            ),
            const Divider(
              height: 2,
              color: Colors.grey,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: const Text(
                'Delete Guest',
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            ),
            Container(
              height: 15,
              color: Colors.transparent,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: const Text(
                'Cancel',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ), //this right here
    );
  }

  Widget _buildScreen(
      GuestDetailsModel guest, List<Trips> trips, BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        Navigator.pop(context);
      },
      child: Container(
        color: Colors.black,
        padding: const EdgeInsets.only(top: 50, right: 8, left: 8),
        child: ListView(
          shrinkWrap: true,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return createActionMenu(context);
                      },
                    );

                    //   showMenu(
                    //     color: Colors.black,
                    //     context: context,
                    //     position: RelativeRect.fromLTRB(
                    //         MediaQuery.of(context).size.width * 0.3,
                    //         0,
                    //         MediaQuery.of(context).size.width * 0.3,
                    //         0.0), //position where you want to show the menu on screen
                    //     items: [
                    //       PopupMenuItem(
                    //           child: Text(
                    //         'Choose Action',
                    //         style: TextStyle(color: Colors.grey, fontSize: 12),
                    //       )),
                    //       PopupMenuItem<String>(
                    //         value: '1',
                    //         child: ElevatedButton(
                    //           onPressed: () {},
                    //           style: ButtonStyle(
                    //             backgroundColor:
                    //                 MaterialStateProperty.all(Colors.black),
                    //           ),
                    //           child: const Text(
                    //             'Edit Guest',
                    //             style:
                    //                 TextStyle(color: Colors.blue, fontSize: 18),
                    //           ),
                    //         ),
                    //       ),
                    //       PopupMenuItem<String>(
                    //         value: '2',
                    //         child: ElevatedButton(
                    //           onPressed: () {},
                    //           style: ButtonStyle(
                    //             backgroundColor:
                    //                 MaterialStateProperty.all(Colors.black),
                    //           ),
                    //           child: const Text(
                    //             'Add Trip',
                    //             style:
                    //                 TextStyle(color: Colors.blue, fontSize: 18),
                    //           ),
                    //         ),
                    //       ),
                    //       PopupMenuItem<String>(
                    //         value: '3',
                    //         child: ElevatedButton(
                    //           onPressed: () {},
                    //           style: ButtonStyle(
                    //             backgroundColor:
                    //                 MaterialStateProperty.all(Colors.black),
                    //           ),
                    //           child: const Text(
                    //             'Delete Guest',
                    //             style: TextStyle(color: Colors.red, fontSize: 18),
                    //           ),
                    //         ),
                    //       ),
                    //       PopupMenuItem<String>(
                    //         value: '2',
                    //         child: ElevatedButton(
                    //           onPressed: () {},
                    //           style: ButtonStyle(
                    //             backgroundColor:
                    //                 MaterialStateProperty.all(Colors.black),
                    //           ),
                    //           child: const Text(
                    //             'Cancel',
                    //             style: TextStyle(
                    //                 color: Colors.blue,
                    //                 fontSize: 18,
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //     elevation: 8.0,
                    //   );
                  },
                  icon: const Icon(Icons.mode_edit_outline_outlined),
                  color: Colors.grey,
                ),
              ],
            ),
            CustomProfileDataContainer(
              guest: guest,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.grey[900],
                  child: ExpansionPanelList.radio(
                    children: trips
                        .map(
                          (trip) => ExpansionPanelRadio(
                            canTapOnHeader: true,
                            backgroundColor: Colors.black38,
                            value: Text(
                              '${trip.id}',
                            ),
                            headerBuilder: (context, isOpen) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: ListTile(
                                  title: Row(
                                    children: [
                                      const Text(
                                        'Trip',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        ' .${trip.status}',
                                        style: trip.status == 'approved'
                                            ? const TextStyle(
                                                color: Colors.green,
                                              )
                                            : const TextStyle(
                                                color: Colors.redAccent,
                                              ),
                                        // '${guest.title}',
                                      ),
                                    ],
                                  ),
                                  trailing: const Icon(
                                    Icons.mode_edit_outline_outlined,
                                    color: Colors.white,
                                  ),
                                  leading: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            },
                            body: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const DefaultTextStyle(
                                        style: kTitleTextStyle,
                                        child: Text(
                                          'Package',
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/profile_img.png',
                                            height: 50,
                                            width: 50,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              DefaultTextStyle(
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                ),
                                                child: Text(
                                                  trip.package?.title ??
                                                      'Platinuim Package',
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: const [
                                                  DefaultTextStyle(
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                    ),
                                                    child: Text(
                                                      // '${trip.package?.features ?? 'Flight'} ',
                                                      'Flight',
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  DefaultTextStyle(
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 16,
                                                    ),
                                                    child: Text(
                                                      'TBD',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const DefaultTextStyle(
                                        style: kTitleTextStyle,
                                        child: Text(
                                          'Companions',
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            leading: CircleAvatar(
                                              child: Image.asset(
                                                'assets/images/profile_img.png',
                                                height: 50,
                                                width: 50,
                                              ),
                                            ),
                                            title: const Text(
                                              'Ahmad',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                            subtitle: const Padding(
                                              padding:
                                                  EdgeInsets.only(top: 16.0),
                                              child: Text(
                                                'US Senitor  |  USA - P ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 15,
                                                  color: Color(0xff9A9A9A),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        itemCount: 2,
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const DefaultTextStyle(
                                        style: kTitleTextStyle,
                                        child: Text(
                                          'Matches',
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          matches = trip.matches ?? [];
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Image.asset(
                                                    'assets/images/profile_img.png',
                                                    height: 20,
                                                    width: 20,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    '${matches[index].firstTeam}',
                                                    // 'QAT',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                                    '${matches[index].secondTeam}',
                                                    // 'ECU',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 18,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    '${matches[index].from}',
                                                    // 'ECU',
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${matches[index].date}',
                                                    // 'ECU',
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          );
                                        },
                                        itemCount: trip.matches?.length ?? 0,
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const DefaultTextStyle(
                                        style: kTitleTextStyle,
                                        child: Text(
                                          'Stay',
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                'assets/images/profile_img.png',
                                                height: 100,
                                                width: 100,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'Presidinial wing',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 15,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    const Text(
                                                      'Marriot hotel',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 15,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    RatingBar(
                                                      itemSize: 20,
                                                      initialRating: 3,
                                                      direction:
                                                          Axis.horizontal,
                                                      allowHalfRating: true,
                                                      itemCount: 5,
                                                      ratingWidget:
                                                          RatingWidget(
                                                        full: const Icon(
                                                          Icons.star,
                                                          color: Colors.yellow,
                                                        ),
                                                        half: const Icon(
                                                          Icons.star_half,
                                                          color: Colors.yellow,
                                                        ),
                                                        empty: const Icon(
                                                          Icons.star_border,
                                                          color: Colors.yellow,
                                                        ),
                                                      ),
                                                      onRatingUpdate: (rating) {
                                                        print(rating);
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    const Text(
                                                      '2',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 15,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                        itemCount: 1,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DefaultTextStyle(
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  child: Text('Organization'),
                ),
                const SizedBox(
                  height: 5,
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                  child: Text(guest.organization ?? ''),
                ),
                const SizedBox(
                  height: 15,
                ),
                const DefaultTextStyle(
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  child: Text('Phone number'),
                ),
                const SizedBox(
                  height: 5,
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                  child: Text(guest.contactNumber ?? ''),
                ),
                const SizedBox(
                  height: 15,
                ),
                const DefaultTextStyle(
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  child: Text('Email'),
                ),
                const SizedBox(
                  height: 5,
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                  child: Text(guest.email ?? ''),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 2.0, color: Colors.white),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(
                                Icons.phone,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Call',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side:
                              const BorderSide(width: 2.0, color: Colors.white),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Email',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    trips = guest.trips ?? [];
    return _buildScreen(guest, trips, context);
    // if (state is GuestsLoaded) {
    // BlocProvider.of<GuestCubit>(context).getGuests();
    // allGuests = BlocProvider.of<GuestCubit>(context).guests;
    //print(trips);
    //print('Build');
    //print(allGuests);

    // } else {
    //   return _buildLoading();
    // }
  }
}

class CustomProfileDataContainer extends StatelessWidget {
  CustomProfileDataContainer({
    required this.guest,
    Key? key,
  }) : super(key: key);

  final GuestDetailsModel guest;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            child: Image.asset('assets/images/profile_img.png'),
          ),
          const SizedBox(
            height: 15,
          ),
          DefaultTextStyle(
            overflow: TextOverflow.visible,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Colors.white,
            ),
            child: Text(guest.firstName ?? ''),
          ),
          const SizedBox(
            height: 5,
          ),
          DefaultTextStyle(
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 15,
              color: Color(0xff9A9A9A),
            ),
            child: Text(guest.title ?? ''),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

// Widget _showChooseAction(BuildContext context) {
//   return Container(
//     height: MediaQuery.of(context).size.height * .5,
//     color: Colors.black,
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         ElevatedButton(
//           onPressed: () {},
//           style: ButtonStyle(
//             backgroundColor: MaterialStateProperty.all(Colors.black),
//           ),
//           child: const Text(
//             'Edit Guest',
//             style: TextStyle(color: Colors.blue, fontSize: 18),
//           ),
//         ),
//         const Divider(
//           height: 2,
//           color: Colors.grey,
//         ),
//         ElevatedButton(
//           onPressed: () {},
//           style: ButtonStyle(
//             backgroundColor: MaterialStateProperty.all(Colors.black),
//           ),
//           child: const Text(
//             'Add Trip',
//             style: TextStyle(color: Colors.blue, fontSize: 18),
//           ),
//         ),
//         const Divider(
//           height: 2,
//           color: Colors.grey,
//         ),
//         ElevatedButton(
//           onPressed: () {},
//           style: ButtonStyle(
//             backgroundColor: MaterialStateProperty.all(Colors.black),
//           ),
//           child: const Text(
//             'Delete Guest',
//             style: TextStyle(color: Colors.red, fontSize: 18),
//           ),
//         ),
//         Container(
//           height: 15,
//           color: Colors.transparent,
//         ),
//         ElevatedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           style: ButtonStyle(
//             backgroundColor: MaterialStateProperty.all(Colors.black),
//           ),
//           child: const Text(
//             'Cancel',
//             style: TextStyle(
//                 color: Colors.blue,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//       ],
//     ),
//   );
// }
