import 'package:flutter/material.dart';
import 'package:sistemas/themes/colors_list.dart';

class ListItemsWidget extends StatelessWidget {
  const ListItemsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ListView.builder(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 25.0,
        ),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: _list.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              top: 13.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                CircleAvatar(
                  foregroundColor: Colors.black,
                  backgroundColor: ColorList.card,
                  child: Text(_list[index].text.substring(0, 1)),
                  minRadius: 30.0,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  _list[index].text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

List<StyleModel> _list = [
  StyleModel(
    id: 1,
    color: Colors.white,
    boxShadow: [],
    text: 'Kardex',
  ),
  StyleModel(
    id: 2,
    color: Colors.white,
    boxShadow: [],
    text: 'Unipol',
  ),
  StyleModel(
    id: 3,
    color: Colors.white,
    boxShadow: [],
    text: 'Monitoreo',
  ),
];

class StyleModel {
  final int id;
  final Color color;
  final List<BoxShadow> boxShadow;
  final String text;

  StyleModel(
      {required this.id,
      required this.color,
      required this.boxShadow,
      required this.text});
}
