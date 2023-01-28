// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'package:flutter/material.dart';
import 'function/func_read.dart';
import 'package:crud_mysql/function/func_getImage.dart';
import 'function/func_edit.dart';
import 'package:image_picker/image_picker.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  String? nama;
  String? NIDN;
  String? mata_kuliah;
  String? SKS;
  String? gambar;

  @override
  void initState() {
    setState(() {
      file = null;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListCloud detailEdit =
        ModalRoute.of(context)!.settings.arguments as ListCloud;

    TextEditingController ctl_Nama =
        TextEditingController(text: detailEdit.Nama);
    TextEditingController ctl_NIDN =
        TextEditingController(text: detailEdit.NIDN);
    TextEditingController ctl_mata_kuliah =
        TextEditingController(text: detailEdit.MataKuliah);
    TextEditingController ctl_SKS = TextEditingController(text: detailEdit.SKS);
    TextEditingController ctl_gambar = TextEditingController();

    if (file != null) {
      gambar = nameFile;
    } else {
      gambar = detailEdit.img.toString();
    }

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(detailEdit.Nama.toString()),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: TextField(
                    controller: ctl_Nama,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nama',
                      hintText: "Isi Nama Lengkap",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: MaterialButton(
                            onPressed: () {
                              takePicture(ImageSource.gallery, setState);
                            },
                            child: Text("Gallery"),
                            color: Colors.yellow)),
                    Expanded(
                        child: MaterialButton(
                      onPressed: () {
                        takePicture(ImageSource.camera, setState);
                      },
                      child: Text("Camera"),
                      color: Colors.deepPurple,
                      textColor: Colors.white,
                    )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(gambar.toString().split('/').last),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: TextField(
                    controller: ctl_NIDN,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'NIDN',
                      hintText: "Isi NIDN",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: TextField(
                    controller: ctl_mata_kuliah,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Mata Kuliah',
                      hintText: "Isi Mata Kuliah",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: TextField(
                    controller: ctl_SKS,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'SKS',
                      hintText: "Isi jumlah SKS",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: MaterialButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () {
                      editData(
                          context,
                          detailEdit.id,
                          ctl_Nama.text,
                          ctl_mata_kuliah.text,
                          ctl_NIDN.text,
                          ctl_SKS.text,
                          file);
                    },
                    child: Text("Simpan"),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
