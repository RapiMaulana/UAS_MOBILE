import 'package:crud_mysql/function/func_handleNull.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'func_isLoading.dart';

addData(context, nama, NIDN, matakuliah, SKS, img) async {
  //handle data kosong
  if (nama == null ||
      NIDN == null ||
      matakuliah == null ||
      SKS == null ||
      img == null) {
    handle("Semua data harus diisi!");
  } else {
    //jika data tidak kosong, loading lalu pushnamed ke fungsi read
    isLoading(context);
    String imgName = img.path.split('/').last;
    FormData sendData = FormData.fromMap({
      "Nama": nama.toString(),
      "NIDN": NIDN.toString(),
      "matakuliah": matakuliah.toString(),
      "SKS": SKS.toString(),
      "url_image":
          await MultipartFile.fromFile(img.path, filename: imgName.toString()),
    });
    final response = await Dio().post(
        "https://oasis2022.000webhostapp.com/add_dosen.php",
        data: sendData);
    log("test send data :" + nama.toString());

    return Navigator.of(context)
        .pushNamedAndRemoveUntil('/read', (Route<dynamic> route) => false);
  }
}
