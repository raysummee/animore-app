import 'dart:convert';
import 'dart:core';
import 'package:animore/logic/api/authentication/auth.dart';
import 'package:animore/logic/helper/authenticationHelper.dart';
import 'package:animore/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as Http;

typedef _ValueGetterSetterDynamic<T> = Future Function(T);
typedef _ValueGetterSetter<T> = Future<bool> Function(T);


Future get(
  Uri uri,{
  _ValueGetterSetterDynamic<Map> onSuccess,
  _ValueGetterSetterDynamic<Map> onNotFound,
  _ValueGetterSetterDynamic<Map> onServerError,
  _ValueGetterSetterDynamic<Map> onServerUnavailable,
  _ValueGetterSetterDynamic<Map> onBadRequest,
  _ValueGetterSetterDynamic<Map> onUnathorized,
  _ValueGetterSetterDynamic<Map> onForibidded,
  _ValueGetterSetterDynamic<Map> onTooManyRequest,
  _ValueGetterSetterDynamic<Http.Response> onCustomRequest,
  bool needAuth:true,
  bool needBool:true,
  bool needLogoutSupport:true
}) async {
  var response = await Http.get(uri, headers:   needAuth? {
    "Authorization": "Bearer ${await AuthenticationHelper().readToken()}",
    "Accept": "application/json"
  }:{ 
    "Accept": "application/json" 
  });

  print(uri);

  var result = await _util(
    response: response, 
    onSuccess: onSuccess, 
    onNotFound: onNotFound, 
    onServerError: onServerError, 
    onServerUnavailable: onServerUnavailable, 
    onBadRequest: onBadRequest, 
    onUnathorized: onUnathorized, 
    onForibidded: onForibidded, 
    onTooManyRequest: onTooManyRequest,
    onCustomRequest: onCustomRequest,
    needBool: needBool,
    needLogoutSupport: needLogoutSupport
  );
  
  if(needBool&&result is bool){
    return result;
  }else if(needBool){
    return false;
  }else{
    return result;
  }
}

Future<bool> post(
  Uri uri,{
  String body,
  _ValueGetterSetter<Map> onSuccess,
  _ValueGetterSetter<Map> onNotFound,
  _ValueGetterSetter<Map> onServerError,
  _ValueGetterSetter<Map> onServerUnavailable,
  _ValueGetterSetter<Map> onBadRequest,
  _ValueGetterSetter<Map> onUnathorized,
  _ValueGetterSetter<Map> onForibidded,
  _ValueGetterSetter<Map> onTooManyRequest,
  _ValueGetterSetter<Http.Response> onCustomRequest,
  bool needAuth:true,
  bool needBool:true,
  bool needLogoutSupport:true
}) async {
  var response = await Http.post(uri, body: body, headers: needAuth? {
    "Authorization": "Bearer ${await AuthenticationHelper().readToken()}",
    "Content-Type": "application/json", 
  }:{    
     "Content-Type": "application/json",
  });

  return await _util(
    response: response, 
    onSuccess: onSuccess, 
    onNotFound: onNotFound, 
    onServerError: onServerError, 
    onServerUnavailable: onServerUnavailable, 
    onBadRequest: onBadRequest, 
    onUnathorized: onUnathorized, 
    onForibidded: onForibidded, 
    onTooManyRequest: onTooManyRequest,
    onCustomRequest: onCustomRequest,
    needBool: needBool,
    needLogoutSupport: needLogoutSupport
  );
}


Future<bool> put(
  Uri uri,{
  String body,
  _ValueGetterSetter<Map> onSuccess,
  _ValueGetterSetter<Map> onNotFound,
  _ValueGetterSetter<Map> onServerError,
  _ValueGetterSetter<Map> onServerUnavailable,
  _ValueGetterSetter<Map> onBadRequest,
  _ValueGetterSetter<Map> onUnathorized,
  _ValueGetterSetter<Map> onForibidded,
  _ValueGetterSetter<Map> onTooManyRequest,
  _ValueGetterSetter<Http.Response> onCustomRequest,
  bool needAuth:true,
  bool needBool:true,
  bool needLogoutSupport:true
}) async {
  var response = await Http.put(uri, body: body, headers: needAuth? {
    "Authorization": "Bearer ${await AuthenticationHelper().readToken()}",
    "Content-Type": "application/json", 
  }:{    
     "Content-Type": "application/json",
  });

  return await _util(
    response: response, 
    onSuccess: onSuccess, 
    onNotFound: onNotFound, 
    onServerError: onServerError, 
    onServerUnavailable: onServerUnavailable, 
    onBadRequest: onBadRequest, 
    onUnathorized: onUnathorized, 
    onForibidded: onForibidded, 
    onTooManyRequest: onTooManyRequest,
    onCustomRequest: onCustomRequest,
    needBool: needBool,
    needLogoutSupport: needBool
  );
}

Future<bool> delete(
  Uri uri,{
  String body,
  _ValueGetterSetter<Map> onSuccess,
  _ValueGetterSetter<Map> onNotFound,
  _ValueGetterSetter<Map> onServerError,
  _ValueGetterSetter<Map> onServerUnavailable,
  _ValueGetterSetter<Map> onBadRequest,
  _ValueGetterSetter<Map> onUnathorized,
  _ValueGetterSetter<Map> onForibidded,
  _ValueGetterSetter<Map> onTooManyRequest,
  _ValueGetterSetter<Http.Response> onCustomRequest,
  bool needAuth:true,
  bool needBool:true,
  bool needLogoutSupport:true
}) async {
  var response = await Http.delete(uri, body: body, headers: needAuth? {
    "Authorization": "Bearer ${await AuthenticationHelper().readToken()}",
    "Content-Type": "application/json", 
  }:{    
     "Content-Type": "application/json",
  });

  return await _util(
    response: response, 
    onSuccess: onSuccess, 
    onNotFound: onNotFound, 
    onServerError: onServerError, 
    onServerUnavailable: onServerUnavailable, 
    onBadRequest: onBadRequest, 
    onUnathorized: onUnathorized, 
    onForibidded: onForibidded, 
    onTooManyRequest: onTooManyRequest,
    onCustomRequest: onCustomRequest,
    needBool: needBool,
    needLogoutSupport: needBool
  );
}

Future _util({
  @required Http.Response response,
  @required _ValueGetterSetter<Map> onSuccess,
  @required _ValueGetterSetter<Map> onNotFound,
  @required _ValueGetterSetter<Map> onServerError,
  @required _ValueGetterSetter<Map> onServerUnavailable,
  @required _ValueGetterSetter<Map> onBadRequest,
  @required _ValueGetterSetter<Map> onUnathorized,
  @required _ValueGetterSetter<Map> onForibidded,
  @required _ValueGetterSetter<Map> onTooManyRequest,
  @required _ValueGetterSetter<Http.Response> onCustomRequest,
  @required bool needBool,
  @required bool needLogoutSupport
}) async {
  if(kDebugMode)
  print("${response.statusCode} : ${response.body}");

  if (response.statusCode >= 200 && response.statusCode < 300)
    return await onSuccess(json.decode(response.body));
  else if (response.statusCode == 401){
    if(onUnathorized!=null){
      return await onUnathorized(json.decode(response.body));
    }else{
      print("not logged");
      if(needLogoutSupport&&navigatorKey!=null&&navigatorKey.currentContext!=null){
        return await Auth().logoutRemote(navigatorKey.currentContext);
      }else{
        return needBool?false:null;
      }
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
  return needBool?false:null;
}


