import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/api_response.dart';

class ApiCommunication {
  late dio.Dio _dio;
  final String baseUrl = 'https://rickandmortyapi.com/graphql';
  late Connectivity connectivity;

  ApiCommunication({int? connectTimeout, int? receiveTimeout}) {
    _dio = Dio();
    _dio.options.connectTimeout =
        Duration(milliseconds: connectTimeout ?? 60000); //1000 = 1s
    _dio.options.receiveTimeout =
        Duration(milliseconds: receiveTimeout ?? 60000);

    connectivity = Connectivity();
  }

  Future<ApiResponse> doPostRequest({
    required String apiEndPoint,
    required String query,
  }) async {
    String requestUrl = '$baseUrl$apiEndPoint';
    debugPrint(
        '--------------------------------------Post Request------------------------------------------------');
    debugPrint('\nRequestUrl: $requestUrl\n');
    debugPrint('--------------------------------------Query\n\n$query');

    if (await isConnectedToInternet()) {
      // Internet Connection is available
      try {
        final dio.Response response = await _dio.post(
          requestUrl,
          data: {'query': query},
        );

        Map<String, dynamic> responseData = response.data;
        debugPrint(
            '--------------------------------------Response Data\n\n$responseData');
        return ApiResponse(
          isSuccessful: true,
          statusCode: response.statusCode,
          message: responseData['message'],
          data: responseData,
        );
      } on DioException catch (error) {
        // Retriving Response Error
        debugPrint('DioException: ${error.message}\n');
        return ApiResponse(
          isSuccessful: false,
          statusCode: error.response?.statusCode,
          message: error.message,
        );
      } catch (error) {
        debugPrint('Unknown Error: ${error.toString()}\n');
        return ApiResponse(
          isSuccessful: false,
          message: 'Unknown Error',
          statusCode: 520,
        );
      }
    } else {
      //! Internet Connection is not available
      const String errorMessage =
          'You are not connected with mobile/wifi network';
      debugPrint(errorMessage);
      return ApiResponse(
        isSuccessful: false,
        statusCode: 503,
        message: errorMessage,
      );
    }
  }

  void endConnection() => _dio.close(force: true);

  Future<bool> isConnectedToInternet() async {
    ConnectivityResult connectivityResult =
        await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
