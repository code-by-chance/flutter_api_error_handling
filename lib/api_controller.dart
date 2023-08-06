import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_error_handling/alert_dialog.dart' as Alert;
import 'package:flutter_api_error_handling/api_exception.dart';
import 'package:get/get.dart';

class APIController {
  Alert.AlertDialog alertDialog = Alert.AlertDialog();

  Future<void> fetchData(BuildContext context) async {
    final dio = Dio(BaseOptions(connectTimeout: Duration(seconds: 5)));
    String url = "https://fakestoreapi.com/products";

    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        print(response.data.toString());
      } else {
        throw DioException(
            requestOptions: RequestOptions(path: url),
            response: response,
            type: DioExceptionType.connectionError);
      }
    } on DioException catch (error) {
      checkException(error, context);
    } catch (error) {
      alertDialog.showAlert(
          context: context, title: 'Error', content: error.toString());
    }
  }

  //let's check it again with error message

  void checkException(DioException error, BuildContext context) {
    ApiException exception = ApiException();
    List<String> errorMessage = exception.getExceptionMessage(error);

    alertDialog.showAlert(
        context: context, title: errorMessage[0], content: errorMessage[1]);
  }
}
