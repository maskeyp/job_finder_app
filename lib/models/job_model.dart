import 'package:flutter/material.dart';

class JobModel {
  final String companyName;
  final String location;
  final String jobDescription;
  final String jobposition;
  final String salary;
  final String totalWorkHours;
  final String deadLine;
  final String shifts;
  final AssetImage image;

  bool isFavorite;

  JobModel({
    required this.companyName,
    required this.location,
    required this.jobDescription,
    required this.jobposition,
    required this.salary,
    required this.totalWorkHours,
    required this.deadLine,
    required this.shifts,
    required this.image,
    this.isFavorite = false,
  });
}
