import 'package:flutter/material.dart';
// import 'package:mid_term_flutter/pages/detailpage.dart';

class CustomToDoItem extends StatelessWidget {
  String? title;
  VoidCallback? onTap;
  VoidCallback? onDeleted;
  IconData? icon;
  CustomToDoItem(
      {super.key, this.title, this.onTap, this.icon, this.onDeleted});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            const EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
        margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    icon ?? Icons.check_box_outline_blank_rounded,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Text(
                  title ?? "",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: onDeleted,
                child: Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
