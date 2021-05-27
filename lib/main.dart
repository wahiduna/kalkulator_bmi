import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wahid_romdhoni/criteria_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BmiCalculator(),
    );
  }
}

// Make stateful widget
class BmiCalculator extends StatefulWidget {
  BmiCalculator({Key key}) : super(key: key);

  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

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
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // Membuat App Bar
        appBar: AppBar(
          title: Text('Kalkulator BMI by Wahid Romdhoni',
              style: TextStyle(color: Colors.white)),
          elevation: 0.0,
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tambahkan Widget Image
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/logo.png', height: 100)
                    ],
                  ),
                  SizedBox(height: 20.0),
                  // Tambahkan Button Kriteria
                  SizedBox(height: 10.0),
                  Container(
                    width: double.infinity,
                    height: 50.0,
                    margin: EdgeInsets.only(
                        left: 30.0, top: 0, right: 30.0, bottom: 20.0),
                    child: ElevatedButton(
                      child: Text('Lihat List Kriteria BMI'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CriteriaListView()),
                        );
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0))),
                      // Event klik button untuk menghitung BMI
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
