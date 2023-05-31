import 'package:flutter/material.dart';
import 'package:mid_term_flutter/compoments/custom_to_do_item.dart';
import 'package:mid_term_flutter/compoments/search_box._compoment.dart';
import 'package:mid_term_flutter/models/to_do_models.dart';

class RecyclePage extends StatefulWidget {
  const RecyclePage({super.key});

  @override
  State<RecyclePage> createState() => _RecyclePageState();
}

class _RecyclePageState extends State<RecyclePage> {
  // ignore: non_constant_identifier_names
  List<ToDoItems> Items = [];
  bool isAdding = false;
  IconData icon = Icons.add;
  final TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            const SearchBox(),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CustomToDoItem(
                    // ignore: unnecessary_string_interpolations
                    title: "${Items[index].title}",
                  );
                },
                itemCount: Items.length,
              ),
            )
          ],
        ),
        Visibility(
            visible: Items.isEmpty,
            child: const Center(
                child: Text(
              "Well nothing to show here!!!",
            ))),
      ]),
    );
  }
}
