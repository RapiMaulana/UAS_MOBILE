import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:image_picker/image_picker.dart';
import 'function/func_getImage.dart';
import 'function/func_add.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  String? nama;
  String? NIDN;
  String? matakuliah;
  String? SKS;

  TextEditingController ctl_nama = TextEditingController();
  TextEditingController ctl_NIDN = TextEditingController();
  TextEditingController ctl_matakuliah = TextEditingController();
  TextEditingController ctl_SKS = TextEditingController();

  @override
  void initState() {
    setState(() {
      file = null;
      nameFile = "Silahkan pilih gambar";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Tambah Data"),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: TextField(
                    controller: ctl_nama,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nama',
                      hintText: "Isi data Nama",
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
                            color: Colors.green)),
                    Expanded(
                        child: MaterialButton(
                      onPressed: () {
                        takePicture(ImageSource.camera, setState);
                      },
                      child: Text("Camera"),
                      color: Colors.lightGreen,
                      textColor: Colors.white,
                    )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(nameFile),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: TextField(
                    controller: ctl_NIDN,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'NIDN',
                      hintText: "Isi NIDN",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: TextField(
                    controller: ctl_matakuliah,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Mata Kuliah',
                      hintText: "Isi Mata Kuliah",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: TextField(
                    controller: ctl_SKS,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'SKS',
                      hintText: "Jumlah SKS",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: MaterialButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () {
                      CircularProgressIndicator();
                      addData(context, ctl_nama.text, ctl_NIDN.text,
                          ctl_matakuliah.text, ctl_SKS.text, file);
                    },
                    child: const Text("Simpan"),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
