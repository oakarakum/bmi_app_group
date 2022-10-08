

import 'package:bmi_app_group/bmicalc.dart';
import 'package:bmi_app_group/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}



class _FirstScreenState extends State<FirstScreen> {
  int gender_index = 0;
  double weight = 0;
  double height = 0;
  int age = 0;
  bool agecont = true;
  bool heightcont = true;
  bool weightcont = true;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>(); 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 25, right: 25, bottom: 30),
        child: GestureDetector(
          onTap: () {


            if (formKey.currentState!.validate()) {
              setState(() {
                formKey.currentState!.save();
              });
              CalculateResult calculateResult = CalculateResult(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: ((context) => SecondScreen(
                bmiC: calculateResult.bmi_calc(),
                cond: calculateResult.condition(),
                adv: calculateResult.advice(),
                ftp: calculateResult.foto()))));

            }
          },
          child: Container(
            height: 50,
            width: 350,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Text(
                "Calculate BMI",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              
              children: [
                SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Let's calculate \nyour current BMI",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 40),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    "You can find out whether you are overweight, underweight or ideal weight.",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  
                  children: [
                    genderbutton("Female", Color.fromARGB(255, 223, 3, 76), 0),
                    genderbutton("Male", Colors.blue, 1),
                    genderbutton("Other", Colors.purple, 2),
                  ],
                ),
                SizedBox(height: 25),
                TextFormField(
                  onChanged: (value) {
                    age = int.parse(value);
                  },
                  inputFormatters: [
                    
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3),
                  ],
                  keyboardType: TextInputType
                      .number, 
                  validator: (value) {
                    if (value!.isEmpty) {
                      agecont == false;
                      return 'Age cannot be empty';
                    } else if (int.parse(value) < 1) {
                      agecont == false;
                      return 'Age cannot be lower than 1';
                    } else if (int.parse(value) > 120) {
                      agecont == false;
                      return 'Age cannot be higher than 120';
                    } else {
                      return null;
                    }
                  },

                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelText: "Age",
                      labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                      hintText: "Age",
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 112, 109, 109),
                          fontSize: 16)),
                ),
                TextFormField(
                  onChanged: (value) {
                    height = double.parse(value);
                  },
                  inputFormatters: [
                    
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3),
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      heightcont == false;
                      return 'Height cannot be empty';
                    } else if (int.parse(value) < 50) {
                      heightcont == false;
                      return 'Height cannot be lower than 50';
                    } else if (int.parse(value) > 220) {
                      heightcont == false;
                      return 'Height cannot be higher than 220';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelText: "Height",
                      labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                      suffixText: "cm",
                      suffixStyle:
                          TextStyle(color: Color.fromARGB(255, 112, 109, 109)),
                      hintText: "Height",
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 112, 109, 109),
                          fontSize: 16)),
                ),
                TextFormField(
                  onChanged: (height) {
                    weight = double.parse(height);
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3),
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      heightcont == false;
                      return 'Weight cannot be empty';
                    } else if (int.parse(value) < 3) {
                      heightcont == false;
                      return 'Weight cannot be lower than 3';
                    } else if (int.parse(value) > 300) {
                      heightcont == false;
                      return 'Weight cannot be higher than 300';
                    } else {}
                  },
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: "Weight",
                      labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                      suffixText: "kg",
                      suffixStyle:
                          TextStyle(color: Color.fromARGB(255, 112, 109, 109)),
                      hintText: "Weight",
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 112, 109, 109),
                          fontSize: 16)),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  void changeIndex(int index) {
    setState(() {
      gender_index = index;
    });
  }

  GestureDetector genderbutton(String value, Color color, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          changeIndex(index);
        });
      },
      child: Container(
        height: 55,
        width: 110,
        decoration: BoxDecoration(
            color: gender_index == index
                ? color
                : Colors
                    .white, //kısa if-else koy arka plan tıklandığında siyah rengi alması için
            border: Border.all(
                color: index == 0
                    ? Color.fromARGB(255, 203, 198, 198)
                    : Color.fromARGB(255, 182, 176, 176)),
            borderRadius: BorderRadius.circular(100)),
        child: Center(
          child: Text(
            value,
            style: TextStyle(
                color: gender_index == index ? Colors.white : Colors.black,
                fontSize:
                    15), //kısa if-else koy arka plan tıklandığında siyah rengi alması için
          ),
        ),
      ),
    );
  }
}