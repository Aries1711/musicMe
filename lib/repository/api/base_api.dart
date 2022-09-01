// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as connection;
import 'package:music_app_challenge/constants/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? token = '';

Future getSharedprefences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  token = prefs.getString('accessToken');
  if (token != '' && token != null) {
    headers[HttpHeaders.authorizationHeader] = "Bearer " + token!;
  }
  headers['device'] = Platform.isAndroid ? 'android' : 'ios';
  return headers;
}

Future<connection.Response> POST(String url, String body) async {
  return await connection.post(
    Uri.https(APP_ENV == "DEV" ? API_URL_DEV : API_URL_PROD, url),
    body: body,
    headers: await getSharedprefences(),
  );
}

Future<connection.Response> POSTPARSE(String url, String body) async {
  return await connection.post(
    Uri.parse(url),
    body: body,
    headers: await getSharedprefences(),
  );
}

Future<connection.Response> GET(String url) async {
  var uri = Uri.https(APP_ENV == "DEV" ? API_URL_DEV : API_URL_PROD, url);
  return await connection.get(
    uri,
    headers: await getSharedprefences(),
  );
}

Future<connection.Response> GETPARSE(String url) async {
  var uri = Uri.parse(
      APP_ENV == "DEV" ? API_URL_HTTPS_DEV : API_URL_HTTPS_PROD + url);
  debugPrint('INI URLNYA ${API_URL_HTTPS_PROD + url}');
  final response = await connection.get(
    uri,
    headers: await getSharedprefences(),
  );
  return response;
}
