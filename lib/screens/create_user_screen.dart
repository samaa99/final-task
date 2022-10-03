import 'package:final_task/models/guest_details_model.dart';
import 'package:final_task/screens/guest_list_screen.dart';
import 'package:final_task/web_services/guest_web_service.dart';
import 'package:flutter/material.dart';

class CreateNewGuest extends StatefulWidget {
  CreateNewGuest({Key? key}) : super(key: key);

  @override
  State<CreateNewGuest> createState() => _CreateNewGuestState();
}

class _CreateNewGuestState extends State<CreateNewGuest> {
  String? _firstName;
  String? _lastName;
  String? _title;
  String? _industry;
  String? _organization;
  String? _email;
  String? _phone;
  String? _userName;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Guest',
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
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: ListView(
          padding: EdgeInsets.all(8),
          shrinkWrap: true,
          children: [
            CircleAvatar(
              child: Image.asset(
                'assets/images/profile_img.png',
                height: 100,
                width: 100,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFormField(
                    cursorColor: Colors.white54,
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusColor: Colors.white,
                      filled: true,
                      fillColor: Colors.black,
                      hintText: 'Shoq',
                      hintStyle: TextStyle(
                        color: Colors.white54,
                        fontSize: 18,
                      ),
                      label: Text(
                        'Fisrt Name',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _firstName = value;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    cursorColor: Colors.white54,
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusColor: Colors.white,
                      filled: true,
                      fillColor: Colors.black,
                      hintText: 'Do',
                      hintStyle: TextStyle(
                        color: Colors.white54,
                        fontSize: 18,
                      ),
                      label: Text(
                        'Last Name',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _lastName = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: TextFormField(
                cursorColor: Colors.white54,
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusColor: Colors.white,
                  filled: true,
                  fillColor: Colors.black,
                  hintText: 'Senitor',
                  hintStyle: TextStyle(
                    color: Colors.white54,
                    fontSize: 18,
                  ),
                  label: Text(
                    'Title',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _title = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: TextFormField(
                cursorColor: Colors.white54,
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusColor: Colors.white,
                  filled: true,
                  fillColor: Colors.black,
                  hintText: 'Political',
                  hintStyle: TextStyle(
                    color: Colors.white54,
                    fontSize: 18,
                  ),
                  label: Text(
                    'Industry',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _industry = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: TextFormField(
                cursorColor: Colors.white54,
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusColor: Colors.white,
                  filled: true,
                  fillColor: Colors.black,
                  hintText: 'Swtch',
                  hintStyle: TextStyle(
                    color: Colors.white54,
                    fontSize: 18,
                  ),
                  label: Text(
                    'Organization',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _organization = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: TextFormField(
                cursorColor: Colors.white54,
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusColor: Colors.white,
                  filled: true,
                  fillColor: Colors.black,
                  hintText: 'shoq@gmail.com',
                  hintStyle: TextStyle(
                    color: Colors.white54,
                    fontSize: 18,
                  ),
                  label: Text(
                    'Email',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: TextFormField(
                cursorColor: Colors.white54,
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusColor: Colors.white,
                  filled: true,
                  fillColor: Colors.black,
                  hintText: '+9335674321',
                  hintStyle: TextStyle(
                    color: Colors.white54,
                    fontSize: 18,
                  ),
                  label: Text(
                    'Phone',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _phone = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: TextFormField(
                cursorColor: Colors.white54,
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusColor: Colors.white,
                  filled: true,
                  fillColor: Colors.black,
                  hintText: 'shoq98',
                  hintStyle: TextStyle(
                    color: Colors.white54,
                    fontSize: 18,
                  ),
                  label: Text(
                    'UserName',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _userName = value;
                  });
                },
              ),
            ),
            Expanded(
              child: TextFormField(
                cursorColor: Colors.white54,
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusColor: Colors.white,
                  filled: true,
                  fillColor: Colors.black,
                  hintText: '*******',
                  hintStyle: TextStyle(
                    color: Colors.white54,
                    fontSize: 18,
                  ),
                  label: Text(
                    'Password',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Guest guest = Guest(
                  username: _userName ?? '',
                  first_name: _firstName ?? '',
                  last_name: _lastName ?? '',
                  organization: _organization ?? '',
                  title: _title ?? '',
                  password_alt: _password ?? '',
                  email: _email ?? '',
                  contact_number: _phone ?? '',
                  img: '',
                  loacalId: '',
                  contact_point_id: '',
                  group_ids: '',
                  password: '12345678',
                  entity_id: '24',
                );
                GuestWebService().createGuest(guest.toJson());
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GuestListScreen()),
                );
              },
              child: const Text(
                'Create and Continue',
                style: TextStyle(color: Colors.black),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
