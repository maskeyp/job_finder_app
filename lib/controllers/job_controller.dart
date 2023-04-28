import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/job_model.dart';

class JobController extends GetxController {
  final jobsList = <JobModel>[
    JobModel(
      companyName: "Google",
      location: "Mountain View, CA",
      jobDescription: "We're looking for a software engineer",
      jobposition: "Software Engineer",
      salary: "\$150,000",
      totalWorkHours: "40 Hours",
      deadLine: "June 30th, 2022",
      shifts: "Day shift, 8:00 AM - 1:00 PM",
      image: const AssetImage('assets/images/logo.png'),
    ),
    JobModel(
      companyName: "Apple",
      location: "Cupertino, CA",
      jobDescription: "We're looking for a designer ",
      jobposition: "Product Designer",
      salary: "\$120,000 ",
      totalWorkHours: "40 Hours",
      deadLine: "July 31st, 2022",
      shifts: "Day shift",
      image: const AssetImage('assets/images/logo.png'),
    ),
    JobModel(
      companyName: "Facebook",
      location: "Menlo Park, CA",
      jobDescription: "We're looking for a data scientist ",
      jobposition: "Data Scientist",
      salary: "\$130,000 ",
      totalWorkHours: "40 Hours",
      deadLine: "August 15th, 2022",
      shifts: "Day shift",
      image: const AssetImage('assets/images/logo.png'),
    ),
    JobModel(
      companyName: "Amazon",
      location: "Mountain View, CA",
      jobDescription: "We're looking for a software engineer",
      jobposition: "Software Engineer",
      salary: "\$150,000 ",
      totalWorkHours: "40 Hours",
      deadLine: "June 30th, 2022",
      shifts: "Day shift",
      image: const AssetImage('assets/images/logo.png'),
    ),
    JobModel(
      companyName: "Youtube",
      location: "Cupertino, CA",
      jobDescription: "We're looking for a designer ",
      jobposition: "Product Designer",
      salary: "\$120,000",
      totalWorkHours: "40 Hours",
      deadLine: "July 31st, 2022",
      shifts: "Day shift",
      image: const AssetImage('assets/images/logo.png'),
    ),
    JobModel(
      companyName: "XYYZZ",
      location: "Menlo Park, CA",
      jobDescription: "We're looking for a data scientist ",
      jobposition: "Data Scientist",
      salary: "\$130,000",
      totalWorkHours: "40 Hours",
      deadLine: "August 15th, 2022",
      shifts: "Day shift",
      image: const AssetImage('assets/images/logo.png'),
    ),
  ].obs;

  var favoriteJobsList = <JobModel>[].obs;

  bool isFavorite(int index) {
    final job = jobsList[index];
    return favoriteJobsList.contains(job);
  }

  void toggleFavorite(int index) {
    final job = jobsList[index];
    job.isFavorite = !job.isFavorite;
    jobsList.refresh();

    if (job.isFavorite) {
      favoriteJobsList.add(job);
      Get.snackbar(
        'Job Added to Favorites',
        '${job.companyName} - ${job.jobposition}',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(milliseconds: 800),
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      favoriteJobsList.remove(job);
      Get.snackbar(
        'Job Removed from Favorites',
        '${job.companyName} - ${job.jobposition}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(milliseconds: 800),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    favoriteJobsList.refresh();
  }

  //adding Search
  final searchTerm = ''.obs;

  List<JobModel> get filteredJobs {
    if (searchTerm.value.isEmpty) {
      return jobsList.toList();
    } else {
      return jobsList
          .where((job) => job.companyName
              .toLowerCase()
              .contains(searchTerm.value.toLowerCase()))
          .toList();
    }
  }

  void setSearchQuery(String query) {
    searchTerm.value = query;
  }

  // bool isFavorite(JobModel job) {
  //   return favoriteJobsList.contains(job);
  // }
}
