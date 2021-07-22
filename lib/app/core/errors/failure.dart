import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  // ignore: prefer_const_constructors_in_immutables
  Failure({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

// Failures generales de la app

// Mensaje de error en caso de falla con el servidor
class ServerFailure extends Failure {
  ServerFailure({required String message}) : super(message: message);
}

// Mensaje de error en caso de falla con el datasource local
class CacheFailure extends Failure {
  CacheFailure({required String message}) : super(message: message);
}