import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../mainscreen_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainscreenController>(
      builder: (controller) => Stack(
        children: [
          // BottomAppBar
          BottomAppBar(
            color: Colors.red,
            height: 100,
            elevation: 8,
            padding: EdgeInsets.all(0),
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: ColoredBox(
              // color: Colors.yellow,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(
                    controller.bottomAppBar.length,
                    ((index) {
                      int i = index;
                      // Skip rendering the FloatingActionButton inside the BottomAppBar
                      if (controller.bottomAppBar[i].isFlatButtin) {
                        return InkWell(
                          onTap: () {
                            if (index != -1) {
                              var fun = controller.bottomAppBar[index].onTapped;
                              if (fun != null) {
                                fun(index); // Call the onTapped function
                              }
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: SizedBox(
                              height: 60,
                              width: 80,
                              child: Card(
                                color: Theme.of(context).colorScheme.primary,
                                elevation: 4,
                                child: Icon(
                                  controller.bottomAppBar
                                      .firstWhere(
                                          (item) => item.isFlatButtin == true)
                                      .icon,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ); // Empty space
                      } else {
                        return _PhCustomNavButton(
                          textbutton: controller.bottomAppBar[i].title,
                          icondata: controller.bottomAppBar[i].icon,
                          onPressed: () {
                            controller.changePage(i);
                          },
                          active: controller.currentpage == i ? true : false,
                        );
                      }
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavButton {
  final Widget page;
  final String title;
  final IconData icon;
  final bool isFlatButtin;
  final void Function(int index)? onTapped;
  NavButton({
    required this.page,
    required this.title,
    required this.icon,
    this.isFlatButtin = false,
    this.onTapped,
  });
}

class _PhCustomNavButton extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  final IconData? icondata;
  final bool? active;
  const _PhCustomNavButton({
    required this.textbutton,
    required this.icondata,
    required this.onPressed,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: AppBar().preferredSize.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icondata,
            color: active == true
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).disabledColor,
          ),
          Text(
            textbutton.tr,
            style: TextStyle(
              color: active == true
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).disabledColor,
            ),
          ),
        ],
      ),
    );
  }
}
