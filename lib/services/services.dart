import 'dart:convert';
import 'package:foodies/models/models.dart';
import 'package:http/http.dart' as http;

part 'restaurant_services.dart';

final tokenKey = '12345';
final baseURL = 'https://restaurant-api.dicoding.dev';
final baseImageURL = 'https://restaurant-api.dicoding.dev/images/small';
