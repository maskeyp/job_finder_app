import 'package:flutter/material.dart';
import 'package:job_finder/constants/styles.dart';

import '../models/job_model.dart';

class JobItemWidget extends StatelessWidget {
  final JobModel job;
  final VoidCallback onFavorite;

  const JobItemWidget({
    Key? key,
    required this.job,
    required this.onFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  job.image.assetName,
                  width: 40,
                  height: 40,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job.companyName,
                        style: heading1,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        job.location,
                        style: const TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.share_outlined)),
                  ],
                )
              ],
            ),
            const Divider(thickness: 1),
            Row(children: [
              Expanded(
                child: Text(
                  job.jobDescription,
                  overflow: TextOverflow.fade,
                  style: heading2,
                ),
              ),
              Text(
                job.salary,
                style: heading2,
              ),
            ]),
            const SizedBox(height: 5),
            Row(children: [
              Expanded(child: Text(job.jobposition)),
              Text(job.totalWorkHours, style: fadedText),
            ]),
            const SizedBox(height: 20),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_month),
                        const SizedBox(width: 10),
                        Text(
                          job.deadLine,
                          style: fadedText,
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.schedule),
                        const SizedBox(width: 10),
                        Text(job.shifts, style: fadedText)
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: job.isFavorite
                      ? const Icon(
                          Icons.bookmark,
                          color: Colors.green,
                        )
                      : const Icon(Icons.bookmark_border),
                  onPressed: onFavorite,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
