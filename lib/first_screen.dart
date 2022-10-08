import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

enum cinsiyet {female, male, other}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
   cinsiyet? indexx;
  final Color aktif = Colors.green;
  final Color inaktif = Colors.white;
  final Color kirmizi = Colors.red;
  final Color mor = Colors.purple;
  final Color textRenk1= Colors.white;
  final Color textRenk2= Colors.black;
 // int gender_index = 0;
 double weight = 0;
  double height = 0;
  int age = 0;
  bool agecont = true;
  bool heightcont = true;
  bool weightcont = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Text(
                "Let's calculate\nyour current BMI",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "You can find out whether you are\noverweight, underweight or ideal weight",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                genderButton("Female", indexx == cinsiyet.female ? aktif : inaktif, 0, (() {
                  setState(() {
                    indexx = cinsiyet.female;
                  });
                }), indexx == cinsiyet.female ? textRenk1 : textRenk2,),
                Spacer(),
                genderButton("Male", indexx == cinsiyet.male ? kirmizi : inaktif, 1, (() {
                  setState(() {
                    indexx = cinsiyet.male;
                  });
                }), indexx == cinsiyet.male ? textRenk1 : textRenk2,),
                Spacer(),
                genderButton("Other", indexx == cinsiyet.other ? mor : inaktif, 2, (() {
                  setState(() {
                    indexx = cinsiyet.other;
                  });
                }), indexx == cinsiyet.other ? textRenk1 : textRenk2,),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            TextFormField(
              onChanged: ((value) {
                age = int.parse(value);
              }),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(3),
              ],
              keyboardType: TextInputType.number,
              validator: (age) {
                    if (age!.isEmpty) {
                      agecont == false;
                      return 'Age section cannot be empty';
                    } else if (int.parse(age) < 1) {
                      agecont == false;
                      return 'Age section cannot be lower than 1';
                    } else if (int.parse(age) > 120) {
                      agecont == false;
                      return 'Age section cannot be higher than 120';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelText: "Age",
                    labelStyle: TextStyle(color: Colors.black, fontSize: 16,),
                    hintText: "Age",
                    hintStyle: TextStyle(color: Color.fromARGB(255, 112, 109, 109),fontSize: 16,),
                  ),
            ),
            TextFormField(
                  onChanged: (value) {
                    height = double.parse(value);
                  },
                  inputFormatters: [
                    
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3),
                  ],
                  validator: (height) {
                    if (height!.isEmpty) {
                      heightcont == false;
                      return 'Height section cannot be empty';
                    } else if (int.parse(height) < 50) {
                      heightcont == false;
                      return 'Height section cannot be lower than 50';
                    } else if (int.parse(height) > 220) {
                      heightcont == false;
                      return 'Height section cannot be higher than 220';
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
                  onChanged: (value) {
                    weight = double.parse(value);
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3),
                  ],
                  validator: (weight) {
                    if (weight!.isEmpty) {
                      heightcont == false;
                      return 'Weight section cannot be empty';
                    } else if (int.parse(weight) < 3) {
                      heightcont == false;
                      return 'Weight section cannot be lower than 3';
                    } else if (int.parse(weight) > 300) {
                      heightcont == false;
                      return 'Weight section cannot be higher than 300';
                    } else {
                      return null;
                    }
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
    );
    
  }
  /* void changedIndex(int index){
    setState(() {
      gender_index = index;
    });
  } */

  InkWell genderButton(String gender, Color bordercolor, int index,  Function() asd,Color textcolorr) {
    return InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: asd /* (() {
                  setState(() {
                    indexx  = asd;
                    /* gender_index = index; */
                  });
                }) */,
                child: Container(
                  height: 50,
                  width: 105,
                  decoration: BoxDecoration(
                    color: bordercolor,/* gender_index == index ? color : Colors.white, */
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.black,
                      width: 0.7
                    )
                    
                  ),
                  child: Center(
                    child: Text(gender, style: TextStyle(fontSize: 17, color: textcolorr),),
                  ),
                ),
              );
  }

}
