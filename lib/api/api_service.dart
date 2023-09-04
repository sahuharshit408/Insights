import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'api_config_utils.dart';
import 'res_base_model.dart';

class ApiService {
  late Dio _dio;
  String tag = "API call :";
  late CancelToken _cancelToken;
  static final Dio mDio = Dio();
  static final ApiService _instance = ApiService._internal();
  factory ApiService() {
    mDio.options.contentType = 'application/json';
    return _instance;
  }

  ApiService._internal() {
    _dio = initApiServiceDio();
  }
  Dio initApiServiceDio() {
    _cancelToken = CancelToken();

    final baseOption = BaseOptions(
        baseUrl: baseUrlProd,
        contentType: 'application/json',
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        headers: {
          'Connection': 'Keep-Alive',
        });
    mDio.options = baseOption;
    mDio.options.queryParameters.toString();
    final mInterceptorsWrapper = InterceptorsWrapper(
      onRequest: (options, handler) async {
        debugPrint("$tag queryParameters ${options.queryParameters.toString()}",
            wrapWidth: 1024);
        debugPrint("$tag headers ${options.headers.toString()}",
            wrapWidth: 1024);
        debugPrint("$tag ${options.baseUrl.toString() + options.path}",
            wrapWidth: 1024);
        debugPrint("$tag ${options.data.toString()}", wrapWidth: 1024);
        handler.next(options);
      },
      onResponse: (response, handler) async {
        debugPrint("Code  ${response.statusCode.toString()}", wrapWidth: 1024);
        debugPrint("Response ${response.toString()}", wrapWidth: 1024);
        handler.next(response);
      },
      onError: (e, handler) async {
        debugPrint("$tag ${e.error.toString()}", wrapWidth: 1024);
        debugPrint("$tag ${e.response.toString()}", wrapWidth: 1024);
        handler.next(e);
      },
    );
    mDio.interceptors.add(mInterceptorsWrapper);

    return mDio;
  }

  void cancelRequests({required CancelToken cancelToken}) {
    cancelToken.cancel();
  }

  Future<Response> get(
    String endUrl, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var isConnected = await checkInternet();
      if (!isConnected) {
        return Future.error(ResBaseModel(
            message:
                "Internet not connected, Please check your network connection",
            status: false,
            data: Data(userid: "null")));
      }
      return await (_dio.get(
        endUrl,
        queryParameters: params,
        cancelToken: cancelToken ?? _cancelToken,
        options: options,
      ));
    } on DioError {
      rethrow;
    }
  }

  Future<Response> post(
    String endUrl, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var isConnected = await checkInternet();
      if (!isConnected) {
        return Future.error(ResBaseModel(
            message:
                "Internet not connected, Please check your network connection",
            status: false,
            data: Data(userid: "null")));
      }
      return await (_dio.post(
        endUrl,
        data: data,
        queryParameters: params,
        cancelToken: cancelToken ?? _cancelToken,
        options: options,
      ));
    } on DioError {
      rethrow;
    }
  }

  Future<Response> put(
    String endUrl, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var isConnected = await checkInternet();
      if (!isConnected) {
        return Future.error(ResBaseModel(
            data: Data(userid: "null"),
            message:
                "Internet not connected, Please check your network connection",
            status: false));
      }

      return await (_dio.put(
        endUrl,
        data: data,
        queryParameters: params,
        cancelToken: cancelToken ?? _cancelToken,
        options: options,
      ));
    } on DioError {
      rethrow;
    }
  }
}

Future<bool> checkInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}
