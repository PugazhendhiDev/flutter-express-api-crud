import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  @override
  _AddData createState() {
    return _AddData();
  }
}

class _AddData extends State<AddData> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  bool valName = false;
  bool valEmail = false;

  Future addData(String name, String email) async {
    var url = "http://192.168.43.238:3001";
    final body = jsonEncode({"name": name, "email": email});
    final response = await http.post(Uri.parse(url + "/user"),
        headers: {
          "Content-Type": "application/json",
        },
        body: body);
    // var dataDecode = jsonDecode(response.body);
    if (response.body == "Success") {
      Navigator.pop(context, "true");
    } else {
      print(response.body);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        titleSpacing: 0.0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                cursorColor: valName ? Colors.red : Colors.lightBlue,
                decoration: InputDecoration(
                  labelText: "Name",
                  floatingLabelStyle: TextStyle(
                    color: valName ? Colors.red : Colors.lightBlue,
                  ),
                  hintText: "Enter the Name",
                  hintStyle: TextStyle(
                    color: valName ? Colors.red : null,
                  ),
                  errorText: valName ? "Name Can\'t Be Empty" : null,
                  errorStyle: const TextStyle(
                    color: Colors.red,
                  ),
                  enabledBorder: const OutlineInputBorder(),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2.0,
                    ),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.lightBlue,
                      width: 2.0,
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    nameController.text.isEmpty
                        ? valName = true
                        : valName = false;
                  });
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: emailController,
                cursorColor: valEmail ? Colors.red : Colors.lightBlue,
                decoration: InputDecoration(
                  labelText: "Email",
                  floatingLabelStyle: TextStyle(
                    color: valEmail ? Colors.red : Colors.lightBlue,
                  ),
                  hintText: "Enter the Email",
                  hintStyle: TextStyle(
                    color: valEmail ? Colors.red : null,
                  ),
                  errorText: valEmail ? "Email Can\'t Be Empty" : null,
                  errorStyle: const TextStyle(
                    color: Colors.red,
                  ),
                  enabledBorder: const OutlineInputBorder(),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2.0,
                    ),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.lightBlue,
                      width: 2.0,
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    emailController.text.isEmpty
                        ? valEmail = true
                        : valEmail = false;
                  });
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        nameController.text.isEmpty
                            ? valName = true
                            : valName = false;
                        emailController.text.isEmpty
                            ? valEmail = true
                            : valEmail = false;
                        if (valName == false && valEmail == false) {
                          addData(nameController.text, emailController.text);
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.lightBlue,
                    ),
                    child: const Text("Add Data"),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, "false");
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                    ),
                    child: const Text("Cancel"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
