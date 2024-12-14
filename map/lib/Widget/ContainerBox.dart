import 'dart:developer';

import 'package:flutter/material.dart';

Container MyContainer({
  required Color color,
  String?label,
  double?width,
  double?height,
  IconData icon = Icons.add,
  VoidCallback? onTap,
})
{
  return Container(
    height: height??200,
    width: width??300,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10.0)
    ),
    child: GestureDetector(
        onTap:onTap,
        child: Icon(icon)
    ),
  );
}