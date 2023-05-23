import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../Services/Supabase/supabaseEnv.dart';

displayUsebyId(Request request , String id) async {

  final supabase = SupabaseEnv().supabase;
  final resultContact = await supabase
      .from("contact")
      .select("platform,value")
      .eq("id", id);

  return Response.ok(
    json.encode(resultContact),
    headers: {"content-type": "application/json"},
  );
}



