import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_finder/constants/styles.dart';
import 'package:job_finder/widgets/job_item_widget.dart';

import '../../controllers/job_controller.dart';

class FavoriteScreen extends StatelessWidget {
  final jobsController = Get.find<JobController>();

  FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () {
              final favoriteJobs = jobsController.favoriteJobsList;
              if (favoriteJobs.isEmpty) {
                return const Center(
                  child: Text(
                    'No favorite jobs',
                    style: heading1,
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: favoriteJobs.length,
                  itemBuilder: (context, index) {
                    final job = favoriteJobs[index];
                    return JobItemWidget(
                      job: job,
                      onFavorite: () => jobsController.toggleFavorite(index),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
