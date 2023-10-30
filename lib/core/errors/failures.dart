import 'package:dio/dio.dart';

abstract class Failures {
  final String errMsg;

  const Failures({required this.errMsg});
}

class ServerFailure extends Failures {
  ServerFailure({required super.errMsg});
  factory ServerFailure.fromDioError (DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMsg: "Connection Timeout");
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMsg: "Send Timeout");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMsg: "Recieve Timeout");
      case DioExceptionType.badCertificate:
        return ServerFailure(errMsg: "User is blocked");
      case DioExceptionType.badResponse:
        return ServerFailure(errMsg: "Can't get data, please try again");
      case DioExceptionType.cancel:
        return ServerFailure(errMsg: "Connection Canceled");
      case DioExceptionType.connectionError:
        return ServerFailure(errMsg: "Connection Error, please try again");
      case DioExceptionType.unknown:
      // check the interner connection
        if (dioException.message!.contains("SocketException")) {
          return ServerFailure(errMsg: "No Internet Connection");
        }
          return ServerFailure(errMsg: "Unexpected Error, please try again");
      default:
          return ServerFailure(errMsg: "Opps Unexpected Error, please try again");
    }
  }
}
