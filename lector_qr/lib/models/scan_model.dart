// To parse this JSON data, do
//
//     final searchResponse = searchResponseFromJson(jsonString);

import 'dart:convert';

SearchResponse searchResponseFromJson(String str) =>
    SearchResponse.fromJson(json.decode(str));
String searchResponseToJson(SearchResponse data) => json.encode(data.toJson());

class SearchResponse {
  //Constructor de la clase
  SearchResponse({
    this.id,
    this.tipo,
    required this.valor,
  }) {
    if (tipo!.contains('http')) {
      tipo = 'http';
    } else {
      tipo = 'geo';
    }
  }

  int? id;
  String? tipo;
  String valor;

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
      };
}
