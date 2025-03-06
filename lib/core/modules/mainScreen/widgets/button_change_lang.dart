import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../localization/controller/locale_controller.dart';

class ButtonChangeLang extends StatelessWidget {
  const ButtonChangeLang({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LcaleController>(builder: (controller) {
      return PopupMenuButton<Locale>(
        // Current selected language
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon for the current language
              Icon(
                Icons.language,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              SizedBox(width: 8),
              // Text for the current language
              Text(
                controller.appLanguages.firstWhere(
                    (e) => e['locale'] == controller.language)['name'],
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
              SizedBox(width: 8),
              // Dropdown arrow
              Icon(
                Icons.arrow_drop_down,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ],
          ),
        ),
        // Language selection menu
        itemBuilder: (BuildContext context) {
          return controller.appLanguages.map<PopupMenuEntry<Locale>>((e) {
            return PopupMenuItem<Locale>(
              value: e['locale'],
              child: Row(
                children: [
                  // Flag or icon for the language
                  Icon(
                    Icons.language,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(width: 8),
                  // Language name
                  Text(
                    e['name'],
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            );
          }).toList();
        },
        // Handle language change
        onSelected: (Locale? newLocale) {
          if (newLocale != null) {
            controller.changeLocale(newLocale);
          }
        },
      );
    });
  }
}
