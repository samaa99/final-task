import 'dart:convert';
import 'dart:io';

import 'package:final_task/constants.dart';
import 'package:final_task/models/guest_details_model.dart';
import 'package:http/http.dart' as http;

class GuestWebService {
  Future<List<dynamic>> getGuests() async {
    Map<String, String> headers = {};
    headers.addAll({HttpHeaders.authorizationHeader: 'Bearer $kToken'});
    http.Response response = await http.get(
        Uri.parse(
            'https://development-blink-api.herokuapp.com/api/v1/listed-data?listed_by=entity&is_owner=false&entity_id=24&group_id=&package_id=&is_approved=false&offset=0&search_text='),
        headers: headers);
    // print(response.statusCode);
    try {
      if (response.body.isNotEmpty) {
        final data = jsonDecode(response.body);
        // print('Web Service');
        // print(data);
        return data;
      } else {
        print('There is no data');
        return [];
      }
    } catch (e) {
      // print(response.statusCode);
      // print(response.body);
      throw 'The request didn\'t happen because of $e';
    }
  }

  Future<dynamic> createGuest(Map<String, dynamic> body) async {
    Map<String, String> headers = {};
    headers.addAll({HttpHeaders.authorizationHeader: 'Bearer $kToken'});
    http.Response response = await http.post(
        Uri.parse(
            'https://development-blink-api.herokuapp.com/api/v1/create-guest'),
        headers: headers,
        body: body);
    try {
      if (response.body.isNotEmpty) {
        final data = jsonDecode(response.body);
        final guest = GuestDetailsModel.fromJson(data);
        print(response.statusCode);
        print(guest);
        return guest;
      } else {
        print(response.statusCode);
        return [];
      }
    } catch (e) {
      print(response.statusCode);
      print(response.body);
      throw 'The request didn\'t happen because of $e';
    }
  }

  Future<List<dynamic>> editGuest() async {
    Map<String, String> headers = {};
    headers.addAll({HttpHeaders.authorizationHeader: 'Bearer $kToken'});
    http.Response response = await http
        .patch(Uri.parse('$kBaseUrl update-guest/xwVtXn'), headers: headers);
    try {
      final data = jsonDecode(response.body);

      return data;
    } catch (e) {
      // print(response.statusCode);
      // print(response.body);
      throw 'The request didn\'t happen because of $e';
    }
  }

  Future<List<dynamic>> deleteGuest() async {
    Map<String, String> headers = {};
    headers.addAll({HttpHeaders.authorizationHeader: 'Bearer $kToken'});
    http.Response response = await http
        .patch(Uri.parse('$kBaseUrl delete-guest/xwVtXn'), headers: headers);
    try {
      final data = jsonDecode(response.body);

      return data;
    } catch (e) {
      // print(response.statusCode);
      // print(response.body);
      throw 'The request didn\'t happen because of $e';
    }
  }
}
