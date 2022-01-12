import 'package:flutter/material.dart';
import 'package:sistemas/pages/appbar.dart';
import 'package:sistemas/pages/widgets/list_items_widget.dart';
import 'package:sistemas/pages/widgets/list_sis_widget.dart';
import 'package:sistemas/pages/widgets/search_bar_widget.dart';
import 'package:sistemas/themes/colors_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // ignore: prefer_const_declarations
  static final routeName = 'homePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          {
            Navigator.pushReplacementNamed(context, 'form');
          }
        }),
        tooltip: 'Formulario',
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: _bodyPage(context),
      ),
    );
  }

  Widget _bodyPage(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          // ignore: prefer_const_constructors
          padding: EdgeInsets.only(
            top: 16.0,
            left: 16.0,
            right: 16.0,
          ),
        ),
        const AppBar1(),
        _body(),
      ],
    );
  }

  Widget _body() {
    // ignore: prefer_const_declarations
    final double _borderValue = 30.0;

    return Expanded(
        child: Flexible(
            child: SingleChildScrollView(
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: 600,
          minWidth: 100,
        ),
        decoration: BoxDecoration(
            color: ColorList.backgroundBody,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(_borderValue),
                topRight: Radius.circular(_borderValue))),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: const [
            Padding(
              padding: EdgeInsets.only(
                left: 30.0,
                right: 30.0,
              ),
              child: SearchBarWidget(),
            ),
            ListItemsWidget(),
            ListSisWidget(),
          ],
        ),
      ),
    )));
  }
}
