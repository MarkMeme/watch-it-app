import 'package:watch_it_app/core/network/error_message_model.dart';

class ServerError implements Exception {
  final ErrorMessageModel errorMessageModel;

  ServerError({required this.errorMessageModel});
}

class DatabaseError implements Exception {
  final String message;

  DatabaseError(this.message);
}
