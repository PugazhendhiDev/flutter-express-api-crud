import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testapp/pages/addData.dart';
import 'package:testapp/pages/updateData.dart';

class Crud extends StatefulWidget {
  @override
  _Crud createState() {
    return _Crud();
  }
}

class _Crud extends State<Crud> {
  Future<List> getData() async {
    const url = "http://192.168.43.238:3001";
    final response = await http.get(Uri.parse(url + "/user"));
    var dataDecode = jsonDecode(response.body);
    return dataDecode;
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void refreshData() {
      setState(() {});
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "CRUD App",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListContainer(
                listData: snapshot.data,
                onRefresh: refreshData,
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("ERROR: " + snapshot.error.toString()));
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.lightBlue,
              ));
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? toRefresh = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddData()),
          );
          if (toRefresh == "true") {
            setState(() {});
          }
        },
        backgroundColor: Colors.lightBlue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ListContainer extends StatelessWidget {
  final List? listData;

  final VoidCallback onRefresh;

  const ListContainer({this.listData, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
      itemCount: listData == null ? 0 : listData?.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 8.0,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.lightBlue,
              radius: 25.0,
              child: Text(
                listData![index]["name"]
                    .toString()
                    .substring(0, 1)
                    .toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              listData?[index]["name"],
              style: const TextStyle(
                color: Colors.lightBlue,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(listData?[index]["email"]),
            onTap: () async {
              String? toRefresh = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UpdateData(
                          id: listData?[index]["id"],
                          preName: listData?[index]["name"],
                          preEmail: listData?[index]["email"],
                        )),
              );
              if (toRefresh == "true") {
                onRefresh();
              }
            },
          ),
        );
      },
    );
  }
}
