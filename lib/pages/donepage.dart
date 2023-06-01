import 'package:flutter/material.dart';
import 'package:mid_term_flutter/compoments/custom_to_do_item.dart';
import 'package:mid_term_flutter/compoments/search_box._compoment.dart';
import 'package:mid_term_flutter/models/to_do_models.dart';
import 'package:mid_term_flutter/service/share_preferences.dart';

class DonePage extends StatefulWidget {
  const DonePage({super.key});

  @override
  State<DonePage> createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> {
  // ignore: non_constant_identifier_names
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
        searchList = value
            .where(
                (element) => element.status == 1 && element.isDelete == false)
            .toList();

        setState(() {});
      }
    });
  }

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
                  return GestureDetector(
                    onTap: () {
                      searchList[index].status = 0;
                      searchList[index].isDelete = false;
                      SharePrefs().addBills(ItemData);
                      getData();
                      setState(() {});
                    },
                    child: CustomToDoItem(
                      // ignore: unnecessary_string_interpolations
                      title: "${searchList[index].title}",
                      icon: Icons.check_box_rounded,
                      onDeleted: () {
                        searchList[index].isDelete = true;
                        SharePrefs().addBills(ItemData);
                        getData();
                        setState(() {});
                      },
                    ),
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
              "You don't have any plan\nLet's start a plan in to do tab",
            ))),
      ]),
    );
  }
}
