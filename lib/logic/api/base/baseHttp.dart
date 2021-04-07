import 'dart:convert';
import 'dart:core';
import 'package:animore/logic/api/authentication/auth.dart';
import 'package:animore/logic/helper/authenticationHelper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as Http;

typedef ValueGetterSetter<Map> = Future<bool> Function(Map);

Future<void> get(
  Uri uri,{
  BuildContext context,
  ValueGetterSetter<Map> onSuccess,
  ValueGetterSetter<Map> onNotFound,
  ValueGetterSetter<Map> onServerError,
  ValueGetterSetter<Map> onServerUnavailable,
  ValueGetterSetter<Map> onBadRequest,
  ValueGetterSetter<Map> onUnathorized,
  ValueGetterSetter<Map> onForibidded,
  ValueGetterSetter<Map> onTooManyRequest,
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
    onTooManyRequest: onTooManyRequest);
}

Future<bool> post(
  Uri uri,{
  String body,
  BuildContext context,
  ValueGetterSetter<Map> onSuccess,
  ValueGetterSetter<Map> onNotFound,
  ValueGetterSetter<Map> onServerError,
  ValueGetterSetter<Map> onServerUnavailable,
  ValueGetterSetter<Map> onBadRequest,
  ValueGetterSetter<Map> onUnathorized,
  ValueGetterSetter<Map> onForibidded,
  ValueGetterSetter<Map> onTooManyRequest,
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
    onTooManyRequest: onTooManyRequest);
}


Future<bool> put(
  Uri uri,{
  String body,
  BuildContext context,
  ValueGetterSetter<Map> onSuccess,
  ValueGetterSetter<Map> onNotFound,
  ValueGetterSetter<Map> onServerError,
  ValueGetterSetter<Map> onServerUnavailable,
  ValueGetterSetter<Map> onBadRequest,
  ValueGetterSetter<Map> onUnathorized,
  ValueGetterSetter<Map> onForibidded,
  ValueGetterSetter<Map> onTooManyRequest,
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
    onTooManyRequest: onTooManyRequest);
}

Future<bool> _util({
  @required Http.Response response,
  @required BuildContext context,
  @required ValueGetterSetter<Map> onSuccess,
  @required ValueGetterSetter<Map> onNotFound,
  @required ValueGetterSetter<Map> onServerError,
  @required ValueGetterSetter<Map> onServerUnavailable,
  @required ValueGetterSetter<Map> onBadRequest,
  @required ValueGetterSetter<Map> onUnathorized,
  @required ValueGetterSetter<Map> onForibidded,
  @required ValueGetterSetter<Map> onTooManyRequest,
}) async {
  if(kDebugMode)
  print("${response.statusCode} : ${response.body}");

  if (response.statusCode >= 200 && response.statusCode < 300)
    return await onSuccess(json.decode(response.body));
  else if (response.statusCode == 401 && onUnathorized!=null)
    return await onUnathorized(json.decode(response.body)) ??() => context!=null?Auth().logout(context):false;
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

  return false;
}


