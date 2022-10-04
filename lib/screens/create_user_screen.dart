import 'dart:io';

import 'package:final_task/models/guest_details_model.dart';
import 'package:final_task/screens/guest_list_screen.dart';
import 'package:final_task/web_services/guest_web_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class CreateNewGuest extends StatefulWidget {
  CreateNewGuest({required this.guestId, Key? key}) : super(key: key);

  String? guestId;
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
  File? _img;
  List<String> industries = [
    'Political',
    'Education',
    'Agriculture',
    'Commerce',
    'Chemical',
  ];

  Widget getAndroidDopDownButton() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String industry in industries) {
      var dropDownItem = DropdownMenuItem<String>(
        value: '$industry',
        child: Text('$industry'),
      );
      dropDownItems.add(dropDownItem);
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1.0, style: BorderStyle.solid, color: Colors.grey),
        ),
      ),
      child: DropdownButton<String>(
        underline: const SizedBox(
          height: 0,
        ),
        isExpanded: true,
        iconSize: 30,
        alignment: AlignmentDirectional.centerStart,
        icon: const Icon(Icons.keyboard_arrow_down),
        value: _industry,
        items: dropDownItems,
        onChanged: (value) {
          setState(() {
            _industry = value;
          });
        },
      ),
    );
  }

  // CupertinoPicker getIOSPicker() {
  //   List<Widget> pickerItems = [];
  //   for (String industry in industries) {
  //     var pickerItem = Text(
  //       industry,
  //       style: const TextStyle(
  //         color: Colors.grey,
  //         fontSize: 16,
  //       ),
  //     );
  //     pickerItems.add(pickerItem);
  //   }
  //   return CupertinoPicker(
  //     itemExtent: 32.0,
  //     onSelectedItemChanged: (selectedIndex) {
  //       setState(() {
  //         _industry = industries[selectedIndex];
  //       });
  //     },
  //     children: pickerItems,
  //   );
  // }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imagePath = File(image.path);
      setState(() {
        _img = imagePath;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image because $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // print('Edit');
    // print(widget.guestId);
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
          padding: const EdgeInsets.all(8),
          shrinkWrap: true,
          children: [
            TextButton(
              onPressed: pickImage,
              child: _img != null
                  ? ClipOval(
                      child: Image.file(
                        _img!,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Image.asset(
                      'assets/images/profile_img.png',
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'First Name',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        cursorColor: Colors.white54,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
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
                        ),
                        onChanged: (value) {
                          setState(() {
                            _firstName = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Last Name',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        cursorColor: Colors.white54,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
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
                        ),
                        onChanged: (value) {
                          setState(() {
                            _lastName = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Title',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  cursorColor: Colors.white54,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
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
                  ),
                  onChanged: (value) {
                    setState(() {
                      _title = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Industry',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                getAndroidDopDownButton(),
              ],
            ),
            // TextFormField(
            //   cursorColor: Colors.white54,
            //   style: TextStyle(color: Colors.white),
            //   decoration: const InputDecoration(
            //     focusedBorder: OutlineInputBorder(
            //       borderSide: BorderSide(
            //         color: Colors.white,
            //       ),
            //     ),
            //     focusColor: Colors.white,
            //     filled: true,
            //     fillColor: Colors.black,
            //     hintText: 'Political',
            //     hintStyle: TextStyle(
            //       color: Colors.white54,
            //       fontSize: 18,
            //     ),
            //     label: Text(
            //       'Industry',
            //       style: TextStyle(color: Colors.white),
            //     ),
            //   ),
            //   onChanged: (value) {
            //     setState(() {
            //       _industry = value;
            //     });
            //   },
            // ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Organization',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  cursorColor: Colors.white54,
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
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
                  ),
                  onChanged: (value) {
                    setState(() {
                      _organization = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Email',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  cursorColor: Colors.white54,
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
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
                  ),
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Phone',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  cursorColor: Colors.white54,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
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
                  ),
                  onChanged: (value) {
                    setState(() {
                      _phone = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Divider(
              height: 5,
              color: Colors.grey,
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'UserName',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  cursorColor: Colors.white54,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
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
                  ),
                  onChanged: (value) {
                    setState(() {
                      _userName = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 15),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Password',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  cursorColor: Colors.white54,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
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
                  ),
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                ),
              ],
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
                  img: _img.toString(),
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
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width * 0.98, 50)),
              ),
              child: const Text(
                'Create and Continue',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                Guest user = Guest(
                  username: _userName ?? '',
                  first_name: _firstName ?? '',
                  last_name: _lastName ?? '',
                  organization: _organization ?? '',
                  title: _title ?? '',
                  password_alt: _password ?? '',
                  email: _email ?? '',
                  contact_number: _phone ?? '',
                  img: _img.toString(),
                  loacalId: '',
                  contact_point_id: '',
                  group_ids: '',
                  password: '12345678',
                  entity_id: '24',
                );

                GuestWebService()
                    .editGuest(user.toJson(), widget.guestId ?? '');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GuestListScreen()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width * 0.98, 50)),
              ),
              child: const Text(
                'Edit and Continue',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
