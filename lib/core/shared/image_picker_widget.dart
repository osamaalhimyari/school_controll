// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// class ImagePickerController extends GetxController {
//   var images = <File>[].obs;

//   // Take a photo using the camera
//   Future<void> takePhoto() async {
//     final picker = ImagePicker();
//     try {
//       final XFile? photo = await picker.pickImage(source: ImageSource.camera);
//       if (photo != null) {
//         images.add(File(photo.path));
//       }
//     } catch (e) {
//       // Handle error
//     }
//   }

//   // Show a dialog to choose between camera and gallery
//   void showImagePickerDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Choose an option'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 leading: Icon(Icons.camera_alt),
//                 title: Text('Take a Photo'),
//                 onTap: () {
//                   Get.back();
//                   takePhoto();
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.photo_library),
//                 title: Text('Pick from Gallery'),
//                 onTap: () {
//                   Get.back();
//                   pickImages();
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   // Pick images from the gallery
//   Future<void> pickImages() async {
//     final picker = ImagePicker();
//     final pickedFiles = await picker.pickMultiImage();
//     images.addAll(pickedFiles.map((file) => File(file.path)));
//   }

//   // Delete an image from the list
//   void deleteImage(int index) {
//     images.removeAt(index);
//   }
// }

// class ImagePickerWidget extends StatelessWidget {
//   const ImagePickerWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Get the ImagePickerController instance
//     ImagePickerController controller = Get.put(ImagePickerController());

//     return Obx(() {
//       return Column(
//         children: [
//           // Button to show the dialog for selecting images
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               InkWell(
//                 onTap: () {
//                   // Show a dialog to choose between camera and gallery
//                   controller.showImagePickerDialog(context);
//                 },
//                 child: CircleAvatar(
//                   radius: 50,
//                   backgroundColor: Theme.of(context).colorScheme.primary,
//                   child: Icon(
//                     Icons.add_a_photo_outlined,
//                     size: 30,
//                     color: Theme.of(context).colorScheme.onPrimary,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 20),

//           // Display selected images in a grid
//           if (controller.images.isNotEmpty)
//             GridView.builder(
//               shrinkWrap: true, // Ensures grid does not take up extra space
//               physics:
//                   NeverScrollableScrollPhysics(), // Disables scroll on the grid
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//                 crossAxisSpacing: 8,
//                 mainAxisSpacing: 8,
//               ),
//               itemCount: controller.images.length,
//               itemBuilder: (context, index) {
//                 return SizedBox(
//                   height: 200,
//                   width: 200,
//                   child: Stack(
//                     children: [
//                       // Delete button to remove an image

//                       Image.file(
//                         controller.images[index],
//                         fit: BoxFit.cover,
//                         height: 200,
//                         width: 200,
//                         // color: Colors.green,
//                       ),
//                       Positioned(
//                         top: 8,
//                         right: 8,
//                         child: GetBuilder<ImagePickerController>(
//                             builder: (controller) {
//                           return CircleAvatar(
//                             backgroundColor: Colors.white.withAlpha(180),
//                             child: IconButton(
//                               icon: Icon(Icons.delete, color: Colors.red),
//                               onPressed: () {
//                                 controller.deleteImage(index);
//                               },
//                             ),
//                           );
//                         }),
//                       ),

//                       // Display image in grid
//                     ],
//                   ),
//                 );
//               },
//             ),
//         ],
//       );
//     });
//   }
// }
