import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:developer';

class ListCloud {
  String id, Nama, NIDN, MataKuliah, SKS, img;
  ListCloud(
      {required this.id,
      required this.Nama,
      required this.NIDN,
      required this.MataKuliah,
      required this.SKS,
      required this.img});
}

Future<List<ListCloud>> read(query) async {
  List<ListCloud> dataList = <ListCloud>[];
  ListCloud tmpData;
  final response = await Dio().get(
      "https://oasis2022.000webhostapp.com/list_dosen.php",
      queryParameters: {
        "key": query.toString(),
      });
  log("test query: $query");
  log("test read data: ${response.data[0]}");
  var data = response.data;
  log("test decode: ${data[0]}");

  if (data.length == 0) {
    return dataList;
  } else {
    List<ListCloud> tdata = [];
    data.forEach((item) {
      tmpData = ListCloud(
          id: item["id"]!,
          Nama: item["Nama"]!,
          NIDN: item["NIDN"]!,
          MataKuliah: item["MataKuliah"]!,
          SKS: item["SKS"]!,
          img: item["img"]!);
      dataList.add(tmpData);
    });
    return dataList;
  }
}
