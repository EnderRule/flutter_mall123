import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

final String apiHost = 'http://123.com.tw';

class APIs {
  static final Uri list = Uri.http(apiHost, '/product/list',<String, String>{
    'id':'0',
    'sort':'0'
  });
  static final Uri detail = Uri.http(apiHost, '/product/detail',<String, String>{
    'id':'0'
  });
}

final _httpClient = HttpClient();

Future<String> getRequest(Uri uri) async {
  var request = await _httpClient.getUrl(uri);
  var response = await request.close();
  return response.transform(utf8.decoder).join();
}

Future<String> postRequest(Uri uri) async{
  var reqeust = await _httpClient.postUrl(uri);
  var response = await reqeust.close();
  return response.transform(utf8.decoder).join();
}

class RequestAPI {

  Future<String> getlist(String id,String sort) async {
    Uri uri = APIs.list.replace(queryParameters: {
      'id':id,
      'sort':sort
    });
    var data = await getRequest(uri);
    return data;
  }


}