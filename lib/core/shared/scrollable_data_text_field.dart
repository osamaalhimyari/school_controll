import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Controller for managing overlay state
class ScrollableDataTextFieldController extends GetxController {
  ScrollableDataTextFieldController({required this.allData});

  var isOverlayVisible = false.obs; // Observable for overlay visibility
  OverlayEntry? _overlayEntry;
  final List<String> allData;
  final RxList<String> filteredData = <String>[].obs;

  void showOverlay(BuildContext context, GlobalKey globalKey,
      Function(String value) onTagSelected) {
    if (_overlayEntry != null) return;

    // Get the RenderBox of the TextField using the GlobalKey
    final RenderBox renderBox =
        globalKey.currentContext?.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy +
            renderBox.size.height, // Add 10 pixels below the TextField
        width: renderBox.size.width,
        child: Material(
          elevation: 4,
          child: Obx(() {
            return filteredData.isEmpty
                ? SizedBox.shrink()
                : DropdownList(
                    data: filteredData,
                    onTagSelected: (value) {
                      if (value != null) {
                        onTagSelected(
                            value); // Call the callback with the selected value
                      }
                      hideOverlay();
                    },
                  );
          }),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    isOverlayVisible.value = true; // Update overlay visibility
  }

  void hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    isOverlayVisible.value = false; // Update overlay visibility
  }

  void filterData(String input) {
    if (input.isEmpty) {
      filteredData.clear();
    } else {
      filteredData.value = allData
          .where((tag) => tag.toLowerCase().contains(input.toLowerCase()))
          .toList();
    }
  }
}

// ignore: must_be_immutable
class ScrollableDataTextField extends StatelessWidget {
  const ScrollableDataTextField({
    super.key,
    required this.globalKey,
    required this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onTapOutside,
    this.hintText,
    required this.allData,
    required this.keyName,
  });

  final TextEditingController controller;
  final List<String> allData;
  final GlobalKey globalKey;
  final String keyName;
  final Function(String value)? onChanged;
  final Function(String value)? onSubmitted;
  final Function(PointerDownEvent event)? onTapOutside;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    // Use Get.lazyPut to ensure a new instance is created each time
    final ScrollableDataTextFieldController scrollableDataTextFieldController =
        Get.put(
      ScrollableDataTextFieldController(allData: allData),
      tag:
          keyName, // Ensure that we don't mix controllers for different TextFields
    );

    return Column(
      children: [
        TextField(
          key: globalKey,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            onChanged?.call(value); // Call the onChanged callback if provided
            scrollableDataTextFieldController.filterData(value);
            if (value.isNotEmpty) {
              scrollableDataTextFieldController.showOverlay(
                context,
                globalKey,
                (selectedValue) {
                  // Call the onSubmitted callback when a value is selected
                  controller.text = selectedValue;
                  onSubmitted?.call(selectedValue);
                },
              );
            } else {
              scrollableDataTextFieldController.hideOverlay();
            }
          },
          onSubmitted: (value) {
            onSubmitted
                ?.call(value); // Call the onSubmitted callback if provided
            scrollableDataTextFieldController.hideOverlay();
          },
          onTapOutside: (event) {
            if (onTapOutside != null) onTapOutside!(event);
          },
        ),
      ],
    );
  }
}

class DropdownList extends StatelessWidget {
  final List<String> data;
  final Function(String? value) onTagSelected;

  const DropdownList({
    required this.data,
    required this.onTagSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return data.isEmpty
        ? SizedBox.shrink()
        : Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary,
                  offset: Offset(-3, 2),
                  blurStyle: BlurStyle.normal,
                ),
              ],
              border: Border.all(color: Theme.of(context).colorScheme.primary),
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Column(
              children: [
                Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            onTagSelected(null);
                          },
                          icon: Icon(Icons.close_outlined))
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(data[index]),
                      onTap: () => onTagSelected(data[index]),
                    );
                  },
                ),
              ],
            ),
          );
  }
}
