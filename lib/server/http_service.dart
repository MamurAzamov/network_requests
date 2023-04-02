import 'dart:convert';

import 'package:http/http.dart';

import '../model/post_model.dart';

class Network{
  static String BASE = "dummy.restapiexample.com";
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  static String API_LIST = "/api/v1/employees";
  static String API_LIST2 = "/api/v1/employees/1";
  static String API_CREATE = "/api/v1/create";
  static String API_UPDATE = "/api/v1/update/21";
  static String API_DELETE = "/api/v1/delete/2";
  
  static Future<String?> GET(String api, Map<String, String> params)async{
    var uri = Uri.https(BASE, api, params);
    var response = await get(uri, headers: headers);
    if(response.statusCode == 200){
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params)async{
    var uri = Uri.https(BASE, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if(response.statusCode == 200){
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params)async{
    var uri = Uri.https(BASE, api, params);
    var response = await put(uri, headers: headers);
    if(response.statusCode == 200 || response.statusCode == 202){
      return response.body;
    }
    return null;
  }

  static Future<String?> DEL(String api, Map<String, String> params)async{
    var uri = Uri.https(BASE, api, params);
    var response = await delete(uri, headers: headers);
    if(response.statusCode == 200){
      return response.body;
    }
    return null;
  }

  static Map<String, String> paramsEmpty(){
    Map<String, String> params = Map();
    return params;
  }

  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = Map();
    params.addAll({
      'title': post.name.toString(),
      'body': post.salary.toString(),
      'userId': post.age.toString(),
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Post post) {
    Map<String, String> params = Map();
    params.addAll({
      'name': post.name.toString(),
      'salary': post.salary.toString(),
      'age': post.age.toString(),
    });
    return params;
  }
}