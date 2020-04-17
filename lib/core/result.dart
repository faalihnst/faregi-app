import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Result<T> {
  ResultType resultType;
  String message;
  int statusCode;
  T data;

  Result(this.resultType, this.message, {this.statusCode, this.data});

  Color get color {
    switch (resultType) {
      case ResultType.Success:
        return Colors.green;
      case ResultType.Warning:
        return Colors.orange;
      case ResultType.Error:
        return Colors.red;
        break;
    }
  }

  IconData get iconData {
    switch (resultType) {
      case ResultType.Success:
        return Icons.check;
      case ResultType.Warning:
        return Icons.warning;
      case ResultType.Error:
        return Icons.error_outline;
      default:
        return Icons.info_outline;
    }
  }

  Result.fromError(DioError e) {
    this
      ..resultType = ResultType.Error
      ..statusCode = e.response.statusCode;
    switch (e.type) {
      case DioErrorType.CONNECT_TIMEOUT:
        this.message = 'Connection timed out';
        break;
      case DioErrorType.SEND_TIMEOUT:
        this.message = 'Connection timed out';
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        this.message = 'Connection timed out';
        break;
      case DioErrorType.RESPONSE:
        this.message = 'Gagal memuat';
        this.data = e.response.data;
        break;
      case DioErrorType.CANCEL:
        this.message = 'Request dibatalkan';
        break;
      case DioErrorType.DEFAULT:
        this.message = 'Terjadi kesalahan';
        break;
    }
  }
}

enum ResultType { Success, Warning, Error }
