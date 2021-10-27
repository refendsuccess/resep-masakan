import 'package:flutter/material.dart';
import 'package:resep_makanan_sederhana/data_makanan.dart';
import 'package:resep_makanan_sederhana/detail_page.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  _buatListMakanan() async {
    for (var i = 0; i < makanan.length; i++) {
      final makanannya = makanan[i];
      final String nama = makanannya['nama'];
      final String gambar = makanannya['gambar'];
      final String deskripsi = makanannya['deskripsi'];

      listDataMakanan.add(
        Container(
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(nama, gambar, deskripsi);
              }));
            },
            child: Card(
              color: Colors.orange[100],
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Image.asset(
                      gambar,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(nama)
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _buatListMakanan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
          backgroundColor: Colors.orange[100],
          title: Text(
            'Menu Makanan',
            style: TextStyle(color: Colors.brown),
          )),
      body: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        childAspectRatio: 1,
        children: listDataMakanan,
      ),
    );
  }
}
