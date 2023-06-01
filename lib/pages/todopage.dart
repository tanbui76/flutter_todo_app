import 'package:flutter/material.dart';
import 'package:mid_term_flutter/compoments/custom_to_do_item.dart';
import 'package:mid_term_flutter/compoments/search_box._compoment.dart';
import 'package:mid_term_flutter/models/to_do_models.dart';
import 'package:flutter/foundation.dart';

import '../service/share_preferences.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  List<ToDoItems> ItemData = [];
  List<ToDoItems> searchList = [];
  @override
  void initState() {
    super.initState();
    debugPrint('initState has runned');
    getData();
  }

  void getData() {
    debugPrint("da run vao getdata");
    SharePrefs().getTodo().then((value) {
      if (value != null) {
        ItemData = value.toList();
        searchList = [...ItemData]
            .where(
                (element) => element.status == 0 && element.isDelete == false)
            .toList();
        setState(() {});
      }
    });
  }

  // ignore: non_constant_identifier_names
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
                padding: const EdgeInsets.all(10),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CustomToDoItem(
                    title: searchList[index].title ?? "",
                    onTap: () {
                      searchList[index].status = 1;
                      searchList[index].isDelete = false;
                      //  ItemData.add(searchList[index]);
                      SharePrefs().addBills(ItemData);
                      getData();
                      setState(() {});
                    },
                    onDeleted: () {
                      searchList[index].isDelete = true;
                      SharePrefs().addBills(ItemData);
                      getData();
                      setState(() {});
                    },
                  );
                },
                itemCount: searchList.length,
              ),
            )
          ],
        ),
        Visibility(
            visible: searchList.isEmpty,
            child: const Center(
                child: Text(
              "Ahh nothing to show here. Good Job!",
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
                          //THÊM Ở ĐÂYYYYYYY

                          ItemData.add(ToDoItems(
                            title: value,
                            status: 0,
                            isDelete: false,
                          ));

                          SharePrefs().addBills(ItemData);
                          getData();
                          setState(() {});
                          titleController.clear();
                        },
                        decoration: const InputDecoration(
                            hintText: "Enter your task",
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
                    decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
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
