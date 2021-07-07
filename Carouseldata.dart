import 'package:flutter/material.dart';

class Carouseldata{
  String imagePath="Assets/images/attandance.jpg";
  String text="ATTENDACE";
  dynamic navigator;
  Carouseldata(image,tex,navigate)
  {
    this.imagePath=image;
    this.text=tex;
    this.navigator=navigate;
  }
}