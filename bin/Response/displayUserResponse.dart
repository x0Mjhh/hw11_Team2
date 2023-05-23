import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';
import '../Services/Supabase/supabaseEnv.dart';

displayUserresponse(Request request) async {

  final jwt = JWT.decode(request.headers["authorization"]!);
  final userAuth = jwt.payload["sub"];
  final supabase = SupabaseEnv().supabase;
  
  final result =
      await supabase.from("users").select("id").eq("id_auth", userAuth);

  final resultContact = await supabase
      .from("contact")
      .select("platform,value")
      .eq("id_user", result[0]["id"]);

  return Response.ok(
    json.encode(resultContact),
    headers: {"content-type": "application/json"},
  );
}



