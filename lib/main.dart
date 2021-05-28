// Mengimport/memanggil library pihak ketiga milik flutter
// library material digunakan  untuk mengimplementasikan material design pada widget flutter
import 'package:flutter/material.dart';
// Mengimport/memanggil library wahid_romdhoni(milik kita sendiri) yang ada pada file criteria_list_view.dart
import 'package:wahid_romdhoni/criteria_list_view.dart';

// Method main() merupakan method yang pertama kali dijalankan ketika aplikasi dijalankan
void main() {
  // Memanggil class MyApp untuk dijalankan pertama kali
  runApp(MyApp());
}

// Class MyApp extends ke StatelessWidget yang artinya widget tersebut dimuat secara statis dimana seluruh konfigurasi yang dimuat didalamnya telah diinisiasikan sejak awal widget tersebut dimuat sehingga tidak dapat diubah dan tidak akan pernah berubah
class MyApp extends StatelessWidget {
  @override
  // Method build() merupakan method milik StatelessWidget yang wajib di definisikan beserta dengan argument BuildContext
  Widget build(BuildContext context) {
    // menerapkan style material design
    return MaterialApp(
      // Memanggil class BMICalculator
      home: BmiCalculator(),
    );
  }
}

// Class BmiCalculator merupakan class yang akan dipanggil ketika build aplikasi
class BmiCalculator extends StatefulWidget {
  // Membuat constructor
  BmiCalculator({Key key}) : super(key: key);

  @override
  // membuat state calculator
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

// Membuat class yang extend ke class State agar dapat synchronous saat widget build
class _BmiCalculatorState extends State<BmiCalculator> {
  //Deklarasi Variabel
  String result = '';
  double height = 0;
  double weight = 0;
  String conclusion = '';

  // Deklarasi Controller Input(untuk mendapatkan value)
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  @override
  // Membuat widget flutter, setiap widget dalam flutter dibuat dari build method
  Widget build(BuildContext context) {
    // Bungkus ui dari widget kedalam container
    return Container(
      child: Scaffold(
        // Membuat App Bar
        appBar: AppBar(
          // Judul App Bar
          title: Text('Kalkulator BMI by Wahid Romdhoni',
              style: TextStyle(color: Colors.white)),
          elevation: 0.0,
          // Set background App Bar menjadi berwarna Biru
          backgroundColor: Colors.blue,
          actions: [
            // Tambahkan icon gear
            IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () {})
          ],
        ),
        // Tambah scrool view untuk menampung widget
        body: SingleChildScrollView(
          // Tambah widget  padding untuk atur jarak ruang antar border dan konten
          child: Padding(
            // Atur padding atas - bawah, kanan - kiri = 12.0
            padding: const EdgeInsets.all(12.0),
            // Tambah widget column untuk menempatkan widget secara menurun atau vertical
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tambahkan Widget Row untuk menempatkan gambar logo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/logo.png', height: 100)
                    ],
                  ),
                  SizedBox(height: 20.0),
                  // Tambahkan Button List kriteria
                  SizedBox(height: 10.0),
                  Container(
                    width: double.infinity,
                    height: 50.0,
                    margin: EdgeInsets.only(
                        left: 30.0, top: 0, right: 30.0, bottom: 20.0),
                    child: ElevatedButton(
                      child: Text('Lihat List Kriteria BMI'),
                      // Event klik button ke CriteriaListView
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CriteriaListView()),
                        );
                      },
                      // Styling button
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0))),
                    ),
                  ),
                  Text(
                    "Tinggi anda (dalam cm) : ",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  // Tambahkan Input Text(tinggi)
                  SizedBox(height: 8.0),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: heightController,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        hintText: "Tinggi anda (dalam cm)",
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none)),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "Berat anda (dalam kg) : ",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  // Tambahkan Input Text(berat)
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: weightController,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        hintText: "Berat anda (dalam kg)",
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none)),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    width: double.infinity,
                    height: 50.0,
                    // Tambahkan Button Hitung
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0))),
                        // Event klik button untuk menghitung BMI
                        onPressed: () {
                          setState(() {
                            height = double.parse(heightController.value.text);
                            weight = double.parse(weightController.value.text);
                          });
                          // Panggil method untuk menghitung BMI
                          calculateBmi(height, weight);
                        },
                        child: Text(
                          "Hitung",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                    // Tambhkan Input Text untuk menampilkan hasil BMI
                    child: Text(
                      "BMI anda : $result",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  // Tambahkan Input Text untuk menampilkan kesimpulan dari hasil BMI
                  Container(
                    width: double.infinity,
                    child: Text(
                      "$conclusion",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25.0, fontStyle: FontStyle.italic),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }

  // Deklarasi Method untuk menghitung BMI
  void calculateBmi(double height, double weight) {
    // Convert cm to meter
    double finalResult = weight / (height * height / 10000);
    String bmi = finalResult.toStringAsFixed(2);
    // Buat state variabel result
    setState(() {
      result = bmi;
    });
    getConclusionBmi(finalResult);
  }

// Deklarasai method untuk mendapatkan kesimpulan BMI
  void getConclusionBmi(double finalResult) {
    String finalConclusion = '';
    // Buat kondisi untuk menentukan hasil akhir
    if (finalResult < 15) {
      finalConclusion = 'anda sangat kurus';
    } else if (finalResult < 19.9) {
      finalConclusion = 'berat badan anda kurang';
    } else if (finalResult < 24.9) {
      finalConclusion = 'berat badan anda normal';
    } else if (finalResult < 29.9) {
      finalConclusion = 'anda kelebihan berat badan';
    } else if (finalResult < 34.9) {
      finalConclusion = 'anda mengalami obesitas kelas I';
    } else if (finalResult < 39.9) {
      finalConclusion = 'anda mengalami obesitas kelas II';
    } else {
      finalConclusion = 'anda mengalami obesitas kelas III';
    }
    // Buat state variabel conclusion
    setState(() {
      conclusion = 'Hasil : $finalConclusion';
    });
  }
}
