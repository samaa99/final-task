import 'package:final_task/business_logic/guest_cubit.dart';
import 'package:final_task/models/guest_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_guest_list.dart';

class GuestListScreen extends StatefulWidget {
  GuestListScreen({Key? key}) : super(key: key);

  @override
  State<GuestListScreen> createState() => _GuestListScreenState();
}

class _GuestListScreenState extends State<GuestListScreen> {
  List<GuestDetailsModel> allGuests = [];

  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'US Embassy',
        style: TextStyle(
          fontSize: 25,
        ),
      ),
      titleSpacing: 10,
      centerTitle: false,
      backgroundColor: Colors.black,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined)),
    );
  }

  Widget _buildSearchTF() {
    return Container(
      color: Colors.grey[900],
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: const [
          Icon(
            Icons.search,
            color: Colors.grey,
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search guests',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    BlocProvider.of<GuestCubit>(context).getGuests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: BlocBuilder<GuestCubit, GuestState>(
        builder: (context, state) {
          allGuests = BlocProvider.of<GuestCubit>(context).guests;

          return Container(
            color: Colors.black,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
                  child: _buildSearchTF(),
                ),
                CustomGuestList(
                  guests: allGuests,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Colors.black,
          size: 30,
        ),
      ),
    );
  }
}
