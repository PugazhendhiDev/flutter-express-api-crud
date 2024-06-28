import "package:flutter/material.dart";

class Appbar extends StatefulWidget {
  @override
  _Appbar createState() {
    return _Appbar();
  }
}

class _Appbar extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 8.0,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Text("Pugazhendhi",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          )),
    );
  }
}
