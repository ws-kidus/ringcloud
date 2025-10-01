import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;
  final int? statusCode;

  const Failure({this.message = "There seems to be an error", this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}
