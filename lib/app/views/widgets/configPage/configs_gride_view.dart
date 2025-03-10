import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/app/controllers/configs_page_controller.dart';

class ConfigsGridView extends GetView<ConfigsPageController> {
  const ConfigsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        itemCount: controller.configs.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.1,
        ),
        itemBuilder: (context, index) {
          var data = controller.configs[index];
          return ConfigCard(
            icon: Icon(data.icon,
                size: 40, color: Theme.of(context).primaryColor),
            text: data.key.tr,
            onPressed: () {
              // Handle tap action
              controller.onPressConfigCard(index);
            },
          );
        },
      ),
    );
  }
}

class ConfigCard extends StatelessWidget {
  const ConfigCard({
    super.key,
    required this.icon,
    required this.text,
    this.onPressed,
  });

  final Widget icon;
  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(height: 12),
              Flexible(
                child: Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
