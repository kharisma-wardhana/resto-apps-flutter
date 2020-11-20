import 'dart:convert';
import 'package:foodies/models/models.dart';
import 'package:http/http.dart' as http;

part 'restaurant_services.dart';

const baseURL = 'https://restaurant-api.dicoding.dev';
const baseImageURL = 'https://restaurant-api.dicoding.dev/images/small';
const endpointListResto = '$baseURL/list';
const endpointDetailResto = '$baseURL/detail';
const endpointSearchResto = '$baseURL/search';
const endpointReviewResto = '$baseURL/review';
