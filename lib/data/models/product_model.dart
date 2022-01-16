
import 'dart:convert';

class ProductModel {
    ProductModel({
        this.id,
        this.titulo,
        this.valor,
        this.disponible,
        this.fotoUrl,
    });

    String id;
    String titulo;
    int valor;
    bool disponible;
    String fotoUrl;

    // factory ProductModel.fromJson(String str) => ProductModel.fromMap(json.decode(str));

    // String toJson() => json.encode(toMap());

    // factory ProductModel.fromMap(dynamic json) => ProductModel(
    //     id: json["id"].toString(),
    //     titulo: json["titulo"].toString(),
    //     valor: json["valor"] as int,
    //     disponible: json["disponible"] as bool,
    //     fotoUrl: json["fotoUrl"].toString(),
    // );

    // // ignore: always_specify_types
    // Map<dynamic, dynamic> toMap() => {
    //     "id": id,
    //     "titulo": titulo,
    //     "valor": valor,
    //     "disponible": disponible,
    //     "fotoUrl": fotoUrl,
    // };
}