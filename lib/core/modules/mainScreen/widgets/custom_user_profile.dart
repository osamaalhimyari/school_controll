import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/localization/controller/locale_controller.dart';

class CustomUserProfile extends StatelessWidget {
  const CustomUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(AuthController());
    return ColoredBox(
      color: Theme.of(context).colorScheme.primary,
      child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: AppBar().preferredSize.height * 1.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // GetBuilder<AuthController>(
                  //   builder: (controller) => IconButton(
                  //       alignment: Alignment.centerRight,
                  //       onPressed: () async {
                  //         myAlertDialog(
                  //           title: Translate.warning1.tr,
                  //           message: "you are gonna sign out",
                  //           onConfirm: () {
                  //             controller.signOut();
                  //           },
                  //         );
                  //       },
                  //       icon: Icon(
                  //         Icons.logout_rounded,
                  //         color: Colors.white,
                  //       )),
                  // ),
                  SizedBox(
                    width: 10,
                  ),
                  GetBuilder<LcaleController>(builder: (controller) {
                    return IconButton(
                        onPressed: () {
                          controller.changeTheme();
                        },
                        icon: Icon(
                          controller.isDark
                              ? Icons.light_mode_outlined
                              : Icons.dark_mode_outlined,
                          color: Colors.white,
                        ));
                  }),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      // Add your onTap logic here
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                          // child:
                          //     (userFire != null && userFire.imageUrl != null)
                          //         ? HandingImageNetwork(
                          //             imageUrl: userFire.imageUrl ?? "",
                          //             errorText: "profile error",
                          //           )
                          //         : Image.asset(AppImageAsset.logo
                          // ),
                          ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // _TitleText(userFire != null
                          //     ? userFire.name ?? ''
                          //     : 'Read Hub'), // Display user's display name or default text
                          const SizedBox(height: 10),
                          // Add more widgets here if needed
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

// class _TitleText extends StatelessWidget {
//   const _TitleText(this.data);

//   final String data;

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       data,
//       style: TextStyle(
//         fontSize: 18,
//         fontWeight: FontWeight.w600,
//         color: Theme.of(context).colorScheme.onPrimary,
//         letterSpacing: 0.8,
//       ),
//       maxLines: 1,
//       overflow: TextOverflow.ellipsis,
//     );
//   }
// }
