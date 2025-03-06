import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../mainscreen_controller.dart';
import 'button_change_lang.dart';
import 'custom_user_profile.dart';

class CustomDrawer extends GetView<MainscreenController> {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomUserProfile(),
            Column(
              children: List.generate(
                  controller.drower.length,
                  (index) => _DrowerButton(
                        data: controller.drower[index],
                        onPressed: () {
                          controller.drower[index].onTapped();
                        },
                      )),
            ),
            const Divider(thickness: 0),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonChangeLang(),
                ))
              ],
            ),
            const Divider(thickness: 0),
          ],
        ),
      ),
    );
  }
}

class _DrowerButton extends StatelessWidget {
  const _DrowerButton({
    required this.data,
    required this.onPressed,
  });

  final DrowerButton data;

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    const double appSpacing = 30;
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(appSpacing),
        child: Row(
          children: [
            // _icon(context,,
            Icon(
              data.icon,
              size: 20,
              color: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(width: appSpacing / 2),
            Expanded(
                child: Text(
              data.title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w600,
                letterSpacing: .8,
                fontSize: 13,
              ),
            )),
            if (data.totalNotif != null)
              Padding(
                padding: const EdgeInsets.only(left: appSpacing / 2),
                child: (data.totalNotif! <= 0)
                    ? Container()
                    : Container(
                        width: 30,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          (data.totalNotif! >= 100)
                              ? "99+"
                              : "${data.totalNotif!}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
              )
          ],
        ),
      ),
    );
  }
}

class DrowerButton {
  final IconData icon;
  final String title;
  final void Function() onTapped;
  final int? totalNotif;
  // final int? totalNotif;
  DrowerButton({
    required this.icon,
    required this.title,
    required this.onTapped,
    this.totalNotif,
  });
}
