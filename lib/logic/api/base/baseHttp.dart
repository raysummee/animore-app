import 'dart:convert';
import 'dart:core';
import 'package:animore/logic/api/authentication/auth.dart';
import 'package:animore/logic/helper/authenticationHelper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as Http;

typedef _ValueGetterSetter<T> = Future<bool> Function(T);

Future<void> get(
  Uri uri,{
  BuildContext context,
  _ValueGetterSetter<Map> onSuccess,
  _ValueGetterSetter<Map> onNotFound,
  _ValueGetterSetter<Map> onServerError,
  _ValueGetterSetter<Map> onServerUnavailable,
  _ValueGetterSetter<Map> onBadRequest,
  _ValueGetterSetter<Map> onUnathorized,
  _ValueGetterSetter<Map> onForibidded,
  _ValueGetterSetter<Map> onTooManyRequest,
  _ValueGetterSetter<Http.Response> onCustomRequest,
  bool needAuth:true
}) async {
  var response = await Http.get(uri, headers:   needAuth? {
    "Authorization": "Bearer ${await AuthenticationHelper().readToken()}",
    "Accept": "application/json"
  }:{ 
    "Accept": "application/json" 
  });

  return await _util(
    response: response, 
    context: context, 
    onSuccess: onSuccess, 
    onNotFound: onNotFound, 
    onServerError: onServerError, 
    onServerUnavailable: onServerUnavailable, 
    onBadRequest: onBadRequest, 
    onUnathorized: onUnathorized, 
    onForibidded: onForibidded, 
    onTooManyRequest: onTooManyRequest,
    onCustomRequest: onCustomRequest);
}

Future<bool> post(
  Uri uri,{
  String body,
  BuildContext context,
  _ValueGetterSetter<Map> onSuccess,
  _ValueGetterSetter<Map> onNotFound,
  _ValueGetterSetter<Map> onServerError,
  _ValueGetterSetter<Map> onServerUnavailable,
  _ValueGetterSetter<Map> onBadRequest,
  _ValueGetterSetter<Map> onUnathorized,
  _ValueGetterSetter<Map> onForibidded,
  _ValueGetterSetter<Map> onTooManyRequest,
  _ValueGetterSetter<Http.Response> onCustomRequest,
  bool needAuth:true
}) async {
  var response = await Http.post(uri, body: body, headers: needAuth? {
    "Authorization": "Bearer ${await AuthenticationHelper().readToken()}",
    "Content-Type": "application/json", 
  }:{    
     "Content-Type": "application/json",
  });

  return await _util(
    response: response, 
    context: context, 
    onSuccess: onSuccess, 
    onNotFound: onNotFound, 
    onServerError: onServerError, 
    onServerUnavailable: onServerUnavailable, 
    onBadRequest: onBadRequest, 
    onUnathorized: onUnathorized, 
    onForibidded: onForibidded, 
    onTooManyRequest: onTooManyRequest,
    onCustomRequest: onCustomRequest);
}


Future<bool> put(
  Uri uri,{
  String body,
  BuildContext context,
  _ValueGetterSetter<Map> onSuccess,
  _ValueGetterSetter<Map> onNotFound,
  _ValueGetterSetter<Map> onServerError,
  _ValueGetterSetter<Map> onServerUnavailable,
  _ValueGetterSetter<Map> onBadRequest,
  _ValueGetterSetter<Map> onUnathorized,
  _ValueGetterSetter<Map> onForibidded,
  _ValueGetterSetter<Map> onTooManyRequest,
  _ValueGetterSetter<Http.Response> onCustomRequest,
  bool needAuth:true
}) async {
  var response = await Http.put(uri, body: body, headers: needAuth? {
    "Authorization": "Bearer ${await AuthenticationHelper().readToken()}",
    "Content-Type": "application/json", 
  }:{    
     "Content-Type": "application/json",
  });

  return await _util(
    response: response, 
    context: context, 
    onSuccess: onSuccess, 
    onNotFound: onNotFound, 
    onServerError: onServerError, 
    onServerUnavailable: onServerUnavailable, 
    onBadRequest: onBadRequest, 
    onUnathorized: onUnathorized, 
    onForibidded: onForibidded, 
    onTooManyRequest: onTooManyRequest,
    onCustomRequest: onCustomRequest);
}

Future<bool> _util({
  @required Http.Response response,
  @required BuildContext context,
  @required _ValueGetterSetter<Map> onSuccess,
  @required _ValueGetterSetter<Map> onNotFound,
  @required _ValueGetterSetter<Map> onServerError,
  @required _ValueGetterSetter<Map> onServerUnavailable,
  @required _ValueGetterSetter<Map> onBadRequest,
  @required _ValueGetterSetter<Map> onUnathorized,
  @required _ValueGetterSetter<Map> onForibidded,
  @required _ValueGetterSetter<Map> onTooManyRequest,
  @required _ValueGetterSetter<Http.Response> onCustomRequest,

}) async {
  if(kDebugMode)
  print("${response.statusCode} : ${response.body}");

  if (response.statusCode >= 200 && response.statusCode < 300)
    return await onSuccess(json.decode(response.body));
  else if (response.statusCode == 401){
    if(onUnathorized!=null){
      print("found ");
      return await onUnathorized(json.decode(response.body));
    }else{
      print("not logged");
      print(context!=null);
      return context!=null?await Auth().logout(context):false;
    }
  }
  else if (response.statusCode == 403 && onForibidded!=null)
    return await onForibidded(json.decode(response.body));
  else if (response.statusCode == 404 && onNotFound!=null)
    return await onNotFound(json.decode(response.body));
  else if (response.statusCode == 503 && onServerUnavailable!=null)
    return await onServerUnavailable(json.decode(response.body));
  else if (response.statusCode >= 500 && response.statusCode < 600 && onServerError!=null)
    return await onServerError(json.decode(response.body));
  else if (response.statusCode == 400 && onBadRequest!=null)
    return await onBadRequest(json.decode(response.body));
  else if (response.statusCode == 429 && onTooManyRequest!=null)
    return await onTooManyRequest(json.decode(response.body));
  else if(onCustomRequest!=null)
    return await onCustomRequest(response);
  return false;
}


