// ignore_for_file: prefer_const_constructors

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 100),
            Container(
              height: 420,
              width: double.infinity,
              color: Colors.blueAccent,
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(height: 20),
                  Text(
                    "Your BMI is",
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "placeholder",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 45,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Text("placeholder", style: TextStyle(fontSize: 20)),
                  SizedBox(height: 15),
                  Text("placeholder", style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10.6),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Text("placeholder", style: TextStyle(fontSize: 20)),
                  )
                ],
              ),
            ),
            SizedBox(height: 200),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 47,
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color.fromARGB(255, 21, 139, 235)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Icon(Icons.restart_alt, color: Colors.white, size: 18),
                      SizedBox(width: 7),
                      Text("Start over",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}