// Mengimport/memanggil library pihak ketiga milik flutter
// library material digunakan  untuk mengimplementasikan material design pada widget flutter
import 'package:flutter/material.dart';
// Mengimport/memanggil library wahid_romdhoni(milik kita sendiri) yang ada pada file criteria-list.dart
import 'package:wahid_romdhoni/criteria-list.dart';

// Class CriteriaListView extends ke StatelessWidget yang artinya widget tersebut dimuat secara statis dimana seluruh konfigurasi yang dimuat didalamnya telah diinisiasikan sejak awal widget tersebut dimuat sehingga tidak dapat diubah dan tidak akan pernah berubah
class CriteriaListView extends StatelessWidget {
  @override
  // Method build() merupakan method milik StatelessWidget yang wajib di definisikan beserta dengan argument BuildContext
  Widget build(BuildContext context) {
    return Scaffold(
      // Membuat App Bar
      appBar: AppBar(
        // Judul App Bar
        title: Text("List Kriteria BMI"),
      ),
      // Tambah scrool view untuk menampung widget
      body: SingleChildScrollView(
        // Tambah widget padding untuk atur jarak ruang antar border dan konten
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          // Tambah widget column untuk menempatkan widget secara menurun atau vertical
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: <Widget>[
                  // Tambahkan widget SizedBox untuk membuat box dengan tinggi 600
                  SizedBox(
                      height: 600, // constrain height
                      child: new Scaffold(
                        body: new CriteriaList(),
                      )),
                ],
              ),
              // Tambahkan widget SizedBox untuk membuat box dengan tinggi 20.0
              SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                height: 50.0,
                // Tambahkan widget ElevatedButton untuk membuat button kembal
                child: ElevatedButton(
                  // Membuat klik event untuk return ke original route/rute utama
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Kembali'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
