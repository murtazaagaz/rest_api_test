import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/rick_n_morty_model.dart';
import 'package:flutter_assignment/storage/endpoints.dart';

import 'package:http/http.dart' as http;

class ApiServices {
  Future<http.Response> fetchCharacters() async {
    http.Response response =
        await http.get(Uri.parse(ENDPOINTS.characters)).timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        return http.Response(jsonEncode({'error': 'Connection Timeout'}),
            200); // Request Timeout response status code
      },
    );
    return response;
  }
}
