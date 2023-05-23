import 'package:flutter/material.dart';
import 'package:mid_term_flutter/compoments/custom_to_do_item.dart';
import 'package:mid_term_flutter/compoments/search_box._compoment.dart';
import 'package:mid_term_flutter/models/to_do_models.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              "All nothing to show here. Good Job!",
            ))),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              margin: const EdgeInsets.only(
                  bottom: 10, left: 10, right: 10, top: 10),
              padding: const EdgeInsets.only(
                  bottom: 15, left: 10, right: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Visibility(
                    visible: isAdding,
                    child: Expanded(
                        child: Container(
                      color: Colors.white,
                      child: TextField(
                        controller: titleController,
                        textInputAction: TextInputAction.done,
                        onSubmitted: (value) {
                          setState(() {
                            Items.add(ToDoItems(title: value));
                            titleController.clear();
                          });
                        },
                        decoration: const InputDecoration(
                            hintText: "Việc cần làm",
                            prefixIcon: Icon(Icons.add),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)))),
                      ),
                    )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  // Spacer(),
                  Container(
                    padding: const EdgeInsets.only(
                        bottom: 10, left: 10, right: 10, top: 10),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (isAdding == true) {
                            isAdding = false;
                            icon = Icons.add;
                          } else {
                            isAdding = true;
                            icon = Icons.close;
                          }
                        });
                      },
                      icon: Icon(icon, color: Colors.white),
                    ),
                  ),
                ],
              )),
        ),
      ]),
    );
  }
}
