import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CriteriaList extends StatelessWidget {
  final String apiUrl = "https://api-wahid.herokuapp.com";

  Future<List<dynamic>> fetchCriteria() async {
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)['results'];
  }

  String _name(dynamic criteria) {
    return criteria['name'];
  }

  String _description(dynamic criteria) {
    return criteria['description'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: fetchCriteria(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              // print(_name(snapshot.data[0]));
              return ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                              title: Text(_name(snapshot.data[index])),
                              subtitle:
                                  Text(_description(snapshot.data[index])),
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
