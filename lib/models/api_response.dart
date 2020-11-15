part of 'models.dart';

class ApiResponse<T> {
  final T data;
  final String message;

  ApiResponse({this.message, this.data});
}
