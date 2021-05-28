// Mengimport/memanggil library pihak ketiga milik flutter
// library material digunakan  untuk mengimplementasikan material design pada widget flutter
import 'package:flutter/material.dart';
// Mengimport/memanggil library dart bernama http untuk melakukan HTTP Request
import 'package:http/http.dart' as http;
// Mengimport/memanggil library dart bernama convert untuk konversi json
import 'dart:convert';

class CriteriaList extends StatelessWidget {
  // Membuat variabel apiUrl untuk menampung url api list kriteria BMI
  final String apiUrl = "https://api-wahid.herokuapp.com";

  // Membuat objek Future bernama fetchCriteria untuk menampung hasil operasi asynchronous fetch api https://api-wahid.herokuapp.com
  Future<List<dynamic>> fetchCriteria() async {
    // Membuat variabel result untuk menapung hasil fetch api
    var result = await http.get(Uri.parse(apiUrl));
    // Mengembalikan hasil kedalam bentuk object dengan perintah json.decode() karena hasil dari api berbentuk json
    return json.decode(result.body)['results'];
  }

  // Membuat object string bernama _name untuk menampung nama
  String _name(dynamic criteria) {
    return criteria['name'];
  }

  // Membuat object string bernama _description untuk menampung description
  String _description(dynamic criteria) {
    return criteria['description'];
  }

  @override
  // Membuat widget flutter, setiap widget dalam flutter dibuat dari build method// Membuat widget flutter, setiap widget dalam flutter dibuat dari build method
  Widget build(BuildContext context) {
    return Scaffold(
      // Bungkus ui dari widget kedalam container
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          // Panggil method fetchCriteria yang merupakan objek future yang telah dibuat sebelumnya
          future: fetchCriteria(),
          // Parsing hasil fetch API
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              // print(_name(snapshot.data[0]));
              // Buat Widget ListView
              return ListView.builder(
                  // Membuat padding
                  padding: EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    // Parsing hasil kedalam bentuk card didalam list view
                    return Card(
                      // Tambah widget column untuk menempatkan widget secara menurun atau vertical
                      child: Column(
                        children: <Widget>[
                          // Memabuat Widget listTile untuk menampilkan List
                          ListTile(
                              // tampilkan _name sebagai title
                              title: Text(_name(snapshot.data[index])),
                              // tampilkan _description sebagai title
                              subtitle:
                                  Text(_description(snapshot.data[index])),
                              // Tambahkan icons accessibility_new
                              leading: Icon(Icons.accessibility_new))
                        ],
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
