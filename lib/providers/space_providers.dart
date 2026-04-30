import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bwa_cozy/models/space.dart';

class SpaceProviders extends ChangeNotifier {
  Future<List<Space>> getRecomendedSpaces() async {
    var result = await http.get(
      Uri.parse("https://bwa-cozy-api.vercel.app/recommended-spaces"),
    );

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Space> spaces = data.map((item) => Space.fromJson(item)).toList();
      return spaces;
    } else {
      return <Space>[];
    }
  }
}
