import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> datalist = ["a", "b", "c"];
  List<String> datalista = ["a1", "a2", "a3", "a4", "a5"];
  List<String> datalistb = ["b1", "b2", "b3", "b4", "b5"];
  List<String> datalistc = ["c1", "c2", "c3", "c4", "c5"];

  String? valueitem;
  String? valueitem2;
  List<String> listitem = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                showModal(context);
              },
              child: Center(
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: const BoxDecoration(color: Colors.black),
                  child: const Center(
                    child: Text(
                      "Show Bottom Sheet",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showModal(BuildContext context) async {
    await showModalBottomSheet(
      isDismissible: false,
      showDragHandle: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              height: 400,
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        labelText: "Select Status",
                        border: OutlineInputBorder(),
                      ),
                      dropdownColor: Colors.white,
                      value: valueitem,
                      onChanged: (String? value) {
                        setState(() {
                          valueitem = value;
                          if (valueitem == "a") {
                            listitem = datalista;
                          } else if (valueitem == "b") {
                            listitem = datalistb;
                          } else if (valueitem == "c") {
                            listitem = datalistc;
                          }
                          valueitem2 = null; // Reset the second dropdown value
                        });
                      },
                      items: datalist
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        labelText: "Select Note",
                        border: OutlineInputBorder(),
                      ),
                      dropdownColor: Colors.white,
                      value: valueitem2,
                      onChanged: (String? value) {
                        setState(() {
                          valueitem2 = value;
                        });
                      },
                      items: listitem
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (valueitem == null || valueitem2 == null) {
                        Fluttertoast.showToast(msg: "Please select both value");
                      } else {
                        Fluttertoast.showToast(
                            msg: "You select $valueitem and $valueitem2");
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
