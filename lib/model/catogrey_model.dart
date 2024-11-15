// To parse this JSON data, do
//
//     final catogeryModels = catogeryModelsFromJson(jsonString);

import 'dart:convert';

List<String> catogeryModelsFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String catogeryModelsToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));
