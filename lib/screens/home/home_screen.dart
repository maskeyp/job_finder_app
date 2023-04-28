import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/job_controller.dart';
import '../../widgets/job_item_widget.dart';
import '../../widgets/search_bar_widget.dart';

import '../../controllers/bottomNavBar_controller.dart';

class HomeScreen extends StatelessWidget {
  final jobController = Get.find<JobController>();
  final BottomNavBarController bottomNavBarController =
      Get.find<BottomNavBarController>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SearchBarWidget(
                onSearch: (value) {
                  jobController.setSearchQuery(value);
                },
              ),
              const SizedBox(height: 15),
              Expanded(
                child: Obx(
                  () {
                    final filteredJobs = jobController.filteredJobs;
                    if (filteredJobs.isEmpty) {
                      return const Center(
                        child: Text('No jobs found'),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: filteredJobs.length,
                        itemBuilder: (context, index) {
                          final job = filteredJobs[index];
                          return JobItemWidget(
                            job: job,
                            onFavorite: () =>
                                jobController.toggleFavorite(index),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
