// ignore_for_file: avoid_print


import 'package:flutter/cupertino.dart';

class CalculateResult {
  CalculateResult({required this.height, required this.weight});
  final double weight;
  final double height;
  late double BMI;

  String bmi_calc() {
    BMI = weight / ((height * height) / 10000);
    return BMI.toStringAsFixed(2);
  }

  String condition() {
    if (BMI < 18.5) {
      return "You are underweight.";
    } else if (BMI >= 18.5 && BMI <= 24.9) {
      return "You are healthy.";
    } else if (BMI >= 25 && BMI <= 29.9) {
      return "You are overweight.";
    } else if (BMI >= 30 && BMI <= 39.9) {
      return "You are obese.";
    } else {
      return "You are morbidly obese.";
    }
  }

  String advice() {
    if (BMI < 18.5) {
      return "You are too skinny. Try to gain some weight.";
    } else if (BMI >= 18.5 && BMI <= 24.9) {
      return "Your weight is good. Keep up the good work.";
    } else if (BMI >= 25 && BMI <= 29.9) {
      return "You should lose some weight. Try to eat less.";
    } else if (BMI >= 30 && BMI <= 39.9) {
      return "You have to lose weight and exercise.";
    } else {
      return "You have to do a strict diet and an exercise.";
    }
  }

  Image foto() {
    if (BMI < 18.5) {
      return Image.network(
          "https://www.ameliyat.com/lib/images/veriler/hastaliklar/287527anoreksiya-hastaligi-ghksg7ksyottsi8vtjcf.webp");
    } else if (BMI >= 18.5 && BMI <= 24.9) {
      return Image.network(
          "https://hthayat.haberturk.com/im/2016/12/20/ver1653164008/1043395_620x360.jpg");
    } else if (BMI >= 25 && BMI <= 29.9) {
      return Image.network(
          "https://media.istockphoto.com/photos/fat-man-does-not-wear-a-shirtoverweight-man-trying-on-cloth-on-white-picture-id1067307700");
    } else if (BMI >= 30 && BMI <= 39.9) {
      return Image.network(
          "https://st2.depositphotos.com/1985863/6080/v/950/depositphotos_60802677-stock-illustration-fat-man.jpg");
    } else {
      return Image.network(
          "https://static9.depositphotos.com/1000647/1179/i/950/depositphotos_11796201-stock-photo-fat-man-eating-hamburger.jpg");
    }
  }
}