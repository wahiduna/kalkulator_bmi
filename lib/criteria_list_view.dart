import 'package:flutter/material.dart';
import 'package:wahid_romdhoni/criteria-list.dart';

class CriteriaListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Kriteria BMI"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: <Widget>[
                  SizedBox(
                      height: 600, // constrain height
                      child: new Scaffold(
                        body: new CriteriaList(),
                      )),
                ],
              ),
              SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
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
