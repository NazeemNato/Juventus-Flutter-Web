import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:juventusRuling/models/data.dart';

class Services {
  static const String url = 'https://gist.githubusercontent.com/NazeemNato/e81e7c63adcd3d9490ecef973175ce0e/raw/5f99aba2e4da7adab3b3bf9514440ec2d22dbf90/juventusPlayers.json';
  static Future<List<PlayerData>> getData() async {
    try{
      final response = await http.get(url);
      if(response.statusCode == 200){
        List<PlayerData> list = parseData(response.body);
        return list;
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }
  static List<PlayerData> parseData (String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<PlayerData>((json)=>PlayerData.fromJson(json)).toList();
  }
}