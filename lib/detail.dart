import 'package:flutter/material.dart';
import 'function/func_read.dart';
import 'function/func_delete.dart';

class Detail extends StatefulWidget {
  Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    ListCloud detail = arguments["data"];

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(detail.Nama.toString()),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Image.network(
                    detail.NIDN.toString(),
                    height: 200,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    detail.MataKuliah.toString(),
                  )),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    detail.SKS.toString(),
                  )),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/edit',
                            arguments: ListCloud(
                                id: detail.id,
                                Nama: detail.Nama,
                                NIDN: detail.NIDN,
                                MataKuliah: detail.MataKuliah,
                                SKS: detail.SKS,
                                img: detail.img));
                      },
                      child: Text("Edit"),
                      color: Colors.green,
                      textColor: Colors.white,
                    )),
                    Expanded(
                        child: MaterialButton(
                      onPressed: () {
                        delete(context, detail.Nama, detail.id);
                      },
                      child: Text("Hapus"),
                      color: Colors.red,
                      textColor: Colors.white,
                    )),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
