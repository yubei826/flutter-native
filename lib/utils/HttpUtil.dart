/*
 * @Author: yubei 
 * @Date: 2019-07-24 13:32:40 
 * @Last Modified by: yubei
 * @Last Modified time: 2019-07-24 18:59:06
 * @Desc: dio 网络请求封装
 */

import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:flutter_native/config/config.dart';

class Http {
  static Http instance;
  static String token;
  static Config _config = new Config();
  static Dio _dio;
  Map<String, dynamic> responseData;
  BaseOptions _options;

  static Http getInstance() {
    print('getInstance');
    if(instance == null) {
      instance = new Http();
    }
    return instance;
  }

  Http() {
    // 初始化 Options
    _options = new BaseOptions(
      baseUrl: _config.baseUrl,
      connectTimeout: _config.connectTimeout,
      receiveTimeout: _config.receiveTimeout,
      headers: {}
    );

    _dio = new Dio(_options);

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        // 在请求被发送之前做一些事情
        return options; //continue
        // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
        // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
        //
        // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
        // 这样请求将被中止并触发异常，上层catchError会被调用。
      },

      onResponse: (Response response) {
        // 在返回响应数据之前做一些预处理
        return _tokenInvalid(response); // continue
      },

      onError: (DioError e) {
        // 当请求失败时做一些预处理
        print(e);
        return e;
      }
    ));
  
    // (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
    //   // config the http client
    //   client.findProxy = (uri) {
    //     //proxy all request to localhost:8888
    //     return "PROXY 192.168.111.161:8888";
    //   };
    //   // you can also create a new HttpClient to dio
    //   // return new HttpClient();
    // };
  }

  // get请求封装
  get(url, data, { options, cancelToken }) async {
    print('get:::url: $url, body: $data');
    Response response;
    try {
      response = await _dio.get(url, queryParameters: data, cancelToken: cancelToken );
    } on DioError catch(e) {
      if (CancelToken.isCancel(e)) {
        print('get请求取消! ' + e.message);
      } else {
        print('get请求发生错误: $e');
      }
    }
    return response.data;
  }

  // post 请求封装
  post(url, data, { options, cancelToken }) async {
    print('post请求::: url：$url ,body: $data');
    Response response;
    try{
      response = await _dio.post(url, data: data !=null ? data : {}, cancelToken: cancelToken );
      print(response);
    }on DioError catch(e){
      if(CancelToken.isCancel(e)){
        print('post请求取消! ' + e.message);
      }else{
        print('post请求发生错误：$e');
      }
    }
    return response.data;
  }

  _tokenInvalid(res) {
    responseData = json.decode(res.data);
    if (responseData['rtn_code'] == '10001' || responseData['rtn_code'] == '0000002') {
      print('需要登录');
    } else {
      return responseData['data'];
    }
  }
}
