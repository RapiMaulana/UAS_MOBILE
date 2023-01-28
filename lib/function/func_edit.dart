import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:developer';
import 'func_isLoading.dart';

editData(context, id, nama, mata_kuliah, NIDN, SKS, img) async {
  //loading lalu pushnamed ke fungsi read
  isLoading(context);
  return Navigator.of(context)
      .pushNamedAndRemoveUntil('/read', (Route<dynamic> route) => false);
}
