import 'package:bmi/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController ageController = TextEditingController();

  final TextEditingController weightController = TextEditingController();
  double bmi = 0;
  String genderSelected = "";
  void calBmi() {
    if (genderSelected.contains("male")) {
      setState(() {
        genderSelected = "male";
        bmi = int.parse(weightController.text) /
            (int.parse(ageController.text) * int.parse(ageController.text));
      });
    } else {
      setState(() {
        genderSelected = "male";
        bmi = int.parse(weightController.text) /
            (int.parse(ageController.text) * int.parse(ageController.text));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange.shade400,
        title: const Text(
          "BmiCalculator",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    genderSelected = "Male";
                  },
                  child: Container(
                    child: const Expanded(
                      child: SizedBox(
                        height: double.infinity,
                        // color: Colors.amber,
                        child: Center(
                          child: Text(
                            "Male",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    genderSelected = "Female";
                  },
                  child: Container(
                    child: Expanded(
                      child: Container(
                        // color: Colors.green,
                        child: const Center(
                          child: Text(
                            "Female",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      controller: ageController,
                      keyboardType: const TextInputType.numberWithOptions(),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 249, 247, 247),
                        hintText: "Enter your age",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      controller: weightController,
                      keyboardType: const TextInputType.numberWithOptions(),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 249, 247, 247),
                        hintText: "Enter your weight",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              // color: const Color.fromARGB(255, 79, 54, 244),
              child: Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.deepOrange.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      "Calculate",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  onPressed: () {
                    calBmi();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          genderSelected: genderSelected,
                          ageController: ageController,
                          weightController: weightController,
                          bmi: bmi,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
