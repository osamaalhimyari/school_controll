import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/app/controllers/configs_page_controller.dart';
import 'package:school_controll/core/functions/format_date.dart';

class ConfigSchoolCard extends GetView<ConfigsPageController> {
  const ConfigSchoolCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: controller.school.logoUri != null &&
                          controller.school.logoUri!.isNotEmpty
                      ? NetworkImage(controller.school.logoUri!)
                      : null,
                  child: controller.school.logoUri == null ||
                          controller.school.logoUri!.isEmpty
                      ? const Icon(Icons.school, size: 30, color: Colors.grey)
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.school.name ?? "Unknown School",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        controller.school.gov ?? "No Government Data",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Icon(
                  controller.school.status ?? false
                      ? Icons.check_circle
                      : Icons.cancel,
                  color: controller.school.status ?? false
                      ? Colors.green
                      : Colors.red,
                  size: 28,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(thickness: 1.2),
            Text(
              controller.school.description ?? "No description available.",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Ministry:", style: TextStyle(color: Colors.grey)),
                Text(
                  controller.school.ministry ?? "Not specified",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Email:", style: TextStyle(color: Colors.grey)),
                Text(
                  controller.school.email ?? "No email provided",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                formatDate("Created:", controller.school.createdAt),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.grey[700]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
