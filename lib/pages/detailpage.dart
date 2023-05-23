import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String item;
  const DetailPage({super.key, required this.item});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("asset/background_detail.jpg"),
                  fit: BoxFit.cover)),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            margin:
                const EdgeInsets.only(bottom: 15, left: 15, right: 15, top: 15),
            padding:
                const EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.all(15.0),
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Text(widget.item,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'TanDien',
                          fontWeight: FontWeight.bold)),
                ),
                const Text(
                    "Đây là một ghi chú tạm thời để kiểm tra!\n\nVà đây là dòng thứ 2 cho cái ghi chú này",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'TanDien',
                        fontWeight: FontWeight.normal)),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
