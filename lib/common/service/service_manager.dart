import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter_rhine/common/service/api_code.dart';
import 'package:flutter_rhine/common/service/result_data.dart';

import 'interceptors/header_interceptor.dart';
import 'interceptors/response_interceptor.dart';
import 'interceptors/token_interceptor.dart';

/// 全局的网络请求对象
final ServiceManager serviceManager = ServiceManager();

class ServiceManager {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  final Dio _dio = Dio();
  final TokenInterceptor _tokenInterceptor = TokenInterceptor();

  ServiceManager() {
    _dio.interceptors.add(new HeaderInterceptors());

    _dio.interceptors.add(new LogInterceptor());

    _dio.interceptors.add(new ResponseInterceptors());

    _dio.interceptors.add(_tokenInterceptor);
  }

  ///发起网络请求
  ///[ url] 请求url
  ///[ params] 请求参数
  ///[ header] 外加头
  ///[ option] 配置
  netFetch(final url, final params, final Map<String, dynamic> header,
      Options option,
      {final bool noTip = false}) async {
    Map<String, dynamic> headers = new HashMap();
    if (header != null) {
      headers.addAll(header);
    }

    if (option != null) {
      option.headers = headers;
    } else {
      option = new Options(method: "get");
      option.headers = headers;
    }

    Response response;
    try {
      response = await _dio.request(url, data: params, options: option);
    } on DioError catch (e) {
      return _resultError(e, noTip);
    }
    if (response.data is DioError) {
      return _resultError(response.data, noTip);
    }
    return response.data;
  }

  /// 生成请求失败对应的error
  /// [e] 网络请求失败的error
  /// [noTip]
  _resultError(final DioError e, final bool noTip) {
    Response errorResponse;
    if (e.response != null) {
      errorResponse = e.response;
    } else {
      errorResponse = new Response(statusCode: 666);
    }
    if (e.type == DioErrorType.CONNECT_TIMEOUT ||
        e.type == DioErrorType.RECEIVE_TIMEOUT) {
      errorResponse.statusCode = ApiCode.NETWORK_TIMEOUT;
    }
    return new ResultData(
        ApiCode.errorHandleFunction(errorResponse.statusCode, e.message, noTip),
        false,
        errorResponse.statusCode);
  }

  ///清除授权
  clearAuthorization() {
    _tokenInterceptor.clearAuthorization();
  }

  ///获取授权token
  getAuthorization() async {
    return _tokenInterceptor.getAuthorization();
  }
}
