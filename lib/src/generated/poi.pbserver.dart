///
//  Generated code. Do not modify.
//  source: protos/poi.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'poi.pb.dart' as $0;
import 'poi.pbjson.dart';

export 'poi.pb.dart';

abstract class PoiLocatorServiceBase extends $pb.GeneratedService {
  $async.Future<$0.PoiReply> getPois($pb.ServerContext ctx, $0.PoiRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'GetPois': return $0.PoiRequest();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'GetPois': return this.getPois(ctx, request as $0.PoiRequest);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => PoiLocatorServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => PoiLocatorServiceBase$messageJson;
}

abstract class AuthenticationServiceBase extends $pb.GeneratedService {
  $async.Future<$0.LoginReply> login($pb.ServerContext ctx, $0.LoginRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'Login': return $0.LoginRequest();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'Login': return this.login(ctx, request as $0.LoginRequest);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => AuthenticationServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => AuthenticationServiceBase$messageJson;
}

