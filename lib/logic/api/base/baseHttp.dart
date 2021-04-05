import 'dart:convert';
import 'dart:core';
import 'package:animore/logic/api/authentication/auth.dart';
import 'package:animore/logic/helper/authenticationHelper.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as Http;

typedef ValueGetterSetter<Map> = Future<bool> Function(Map);

Future<void> get(
  Uri uri,
  BuildContext context, {
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

  print(response.statusCode);

  if (response.statusCode > 200 && response.statusCode < 300)
    return await onSuccess(json.decode(response.body));
  else if (response.statusCode == 401)
    return await onUnathorized(json.decode(response.body)) ??
        () => Auth().logout(context);
  else if (response.statusCode == 403)
    return await onForibidded(json.decode(response.body));
  else if (response.statusCode == 404)
    return await onNotFound(json.decode(response.body));
  else if (response.statusCode == 503)
    return await onServerUnavailable(json.decode(response.body));
  else if (response.statusCode >= 500 && response.statusCode < 600)
    return await onServerError(json.decode(response.body));
  else if (response.statusCode == 400)
    return await onBadRequest(json.decode(response.body));
  else if (response.statusCode == 429)
    return await onTooManyRequest(json.decode(response.body));

  return false;
}

Future<bool> post(
  Uri uri,
  String body,
  BuildContext context, {
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

  print(response.statusCode);

  if (response.statusCode >= 200 && response.statusCode < 300)
    return await onSuccess(json.decode(response.body));
  else if (response.statusCode == 401)
    return await onUnathorized(json.decode(response.body)) ??
        () => Auth().logout(context);
  else if (response.statusCode == 403)
    return await onForibidded(json.decode(response.body));
  else if (response.statusCode == 404)
    return await onNotFound(json.decode(response.body));
  else if (response.statusCode == 503)
    return await onServerUnavailable(json.decode(response.body));
  else if (response.statusCode >= 500 && response.statusCode < 600)
    return await onServerError(json.decode(response.body));
  else if (response.statusCode == 400)
    return await onBadRequest(json.decode(response.body));
  else if (response.statusCode == 429)
    return await onTooManyRequest(json.decode(response.body));

  return false;
}
