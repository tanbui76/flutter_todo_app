import 'package:flutter/material.dart';
import 'package:mid_term_flutter/pages/detailpage.dart';

class CustomToDoItem extends StatelessWidget {
  final String title;
  const CustomToDoItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(item: title),
            ))
      },
      child: Container(
          padding:
              const EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
          margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(right: 10),
                child: const Icon(
                  Icons.check_box_outline_blank_rounded,
                  color: Colors.grey,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
