import 'package:flutter/material.dart';

@immutable
class ImcModel {
  final int? id;
  final double? peso;
  final double? altura;
  final DateTime? dataPesagem;
  final double? resultadoImc;

  const ImcModel({
    this.id,
    this.peso,
    this.altura,
    this.dataPesagem,
    this.resultadoImc,
  });

  ImcModel copyWith({
    int? id,
    double? peso,
    double? altura,
    DateTime? dataPesagem,
    double? resultadoImc,
  }) {
    return ImcModel(
      id: id ?? this.id,
      peso: peso ?? this.peso,
      altura: altura ?? this.altura,
      dataPesagem: dataPesagem ?? this.dataPesagem,
      resultadoImc: resultadoImc ?? this.resultadoImc,
    );
  }
}
