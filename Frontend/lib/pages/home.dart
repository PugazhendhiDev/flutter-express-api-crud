import 'package:flutter/material.dart';
import "package:testapp/components/appbar.dart";

class Home extends StatefulWidget {
  @override
  _Home createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return homePage();
  }

  SafeArea homePage() {
    List<Widget> row1 = [
      contentBoxRow(
        title: "Dosa",
        //image: "https://foodish-api.com/images/dosa/dosa1.jpg",
        bgcolor: Colors.orangeAccent,
        txtcolor: Colors.white,
        loadercolor: Colors.white,
      ),
      contentBoxRow(
        title: "Dosa",
        //image: "https://foodish-api.com/images/dosa/dosa2.jpg",
        bgcolor: Colors.pinkAccent,
        txtcolor: Colors.white,
        loadercolor: Colors.white,
      ),
      contentBoxRow(
        title: "Dosa",
        //image: "https://foodish-api.com/images/dosa/dosa3.jpg",
        bgcolor: Colors.purpleAccent,
        txtcolor: Colors.white,
        loadercolor: Colors.white,
      ),
      contentBoxRow(
        title: "Dosa",
        //image: "https://foodish-api.com/images/dosa/dosa4.jpg",
        bgcolor: Colors.indigoAccent,
        txtcolor: Colors.white,
        loadercolor: Colors.white,
      ),
      contentBoxRow(
        title: "Dosa",
        //image: "https://foodish-api.com/images/dosa/dosa5.jpg",
        bgcolor: Colors.redAccent,
        txtcolor: Colors.white,
        loadercolor: Colors.white,
      ),
    ];

    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Appbar(),
                contentBox(
                    title: "Pizza",
                    //image: "https://foodish-api.com/images/pizza/pizza5.jpg",
                    bgcolor: Colors.red,
                    txtcolor: Colors.white,
                    titleAlignment: Alignment.topLeft),
                containerBoxRow(row1,
                    title: "Dosa Menu", titleAlignment: Alignment.topLeft),
                contentBox(
                    title: "Burger",
                    //image: "https://foodish-api.com/images/burger/burger5.jpg",
                    bgcolor: Colors.pinkAccent,
                    txtcolor: Colors.white,
                    titleAlignment: Alignment.topLeft),
                contentBox(
                    title: "Butter Chicken",
                    //image: "https://foodish-api.com/images/butter-chicken/butter-chicken5.jpg",
                    bgcolor: Colors.orangeAccent,
                    txtcolor: Colors.white,
                    titleAlignment: Alignment.topLeft),
              ]),
        ),
      ),
    );
  }
}

contentBox({
  String? title,
  String? image,
  Color? bgcolor,
  Color? txtcolor,
  Color? loadercolor,
  AlignmentGeometry? titleAlignment,
}) {
  return Container(
    margin: const EdgeInsets.all(10.0),
    padding: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: bgcolor ?? Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          blurRadius: 8.0,
          offset: const Offset(0, 0),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        title != null
            ? Align(
                alignment: titleAlignment ?? Alignment.center,
                child: Text(title,
                    style: TextStyle(
                      color: bgcolor == Colors.black
                          ? txtcolor ?? Colors.white
                          : txtcolor ?? Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    )),
              )
            : const SizedBox.shrink(),
        image != null
            ? Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: txtcolor == Colors.black
                        ? loadercolor ?? Colors.black
                        : loadercolor ?? Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      image,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    ),
  );
}

containerBoxRow(List<Widget> contentList,
    {String? title,
    Color? bgcolor,
    Color? txtcolor,
    AlignmentGeometry? titleAlignment}) {
  return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: bgcolor ?? Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 8.0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          title != null
              ? Align(
                  alignment: titleAlignment ?? Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 14.0, 10.0, 0.0),
                    child: Text(title,
                        style: TextStyle(
                          color: bgcolor == Colors.black
                              ? txtcolor ?? Colors.white
                              : txtcolor ?? Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        )),
                  ),
                )
              : const SizedBox.shrink(),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: contentList)),
        ],
      ));
}

contentBoxRow(
    {String? title,
    String? image,
    Color? bgcolor,
    Color? txtcolor,
    Color? loadercolor,
    AlignmentGeometry? titleAlignment}) {
  return Container(
    margin: const EdgeInsets.all(10.0),
    height: 200.0,
    width: 180.0,
    decoration: BoxDecoration(
      color: bgcolor ?? Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          blurRadius: 8.0,
          offset: const Offset(0, 0),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        image != null
            ? Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: txtcolor == Colors.black
                      ? loadercolor ?? Colors.black
                      : loadercolor ?? Colors.white,
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : const SizedBox.shrink(),
        image != null && title != null
            ? const SizedBox(
                height: 10.0,
              )
            : const SizedBox(height: 0.0),
        title != null
            ? Align(
                alignment: titleAlignment ?? Alignment.center,
                child: Text(title,
                    style: TextStyle(
                      color: bgcolor == Colors.black
                          ? txtcolor ?? Colors.white
                          : txtcolor ?? Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    )),
              )
            : const SizedBox.shrink(),
      ],
    ),
  );
}
