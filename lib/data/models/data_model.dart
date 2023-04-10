// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

List<DataModel> dataModelFromJson(String str) =>
    List<DataModel>.from(json.decode(str).map((x) => DataModel.fromJson(x)));

String dataModelToJson(List<DataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataModel {
  DataModel({
    required this.dialog,
    required this.conversationIndex,
    required this.responses,
    required this.values,
    required this.navigation,
  });

  String dialog;
  int conversationIndex;
  List<String> responses;
  List<int> values;
  List<int> navigation;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        dialog: json["dialog"],
        conversationIndex: json["conversation_index"],
        responses: List<String>.from(json["responses"].map((x) => x)),
        values: List<int>.from(json["values"].map((x) => x)),
        navigation: List<int>.from(json["navigation"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "dialog": dialog,
        "conversation_index": conversationIndex,
        "responses": List<dynamic>.from(responses.map((x) => x)),
        "values": List<dynamic>.from(values.map((x) => x)),
        "navigation": List<dynamic>.from(navigation.map((x) => x)),
      };
}
