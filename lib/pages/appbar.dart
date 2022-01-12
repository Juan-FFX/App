import 'package:flutter/material.dart';
import 'package:sistemas/pages/home_page.dart';

class AppBar1 extends StatelessWidget {
  const AppBar1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              "Admin",
              style: TextStyle(color: Colors.black45),
            ),
            Row(
              children: const [
                Icon(
                  Icons.phonelink,
                  color: Colors.black,
                ),
                Text(
                  "Sistemas, ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 19.0),
                ),
                Text(
                  "SSC ",
                  style: TextStyle(color: Colors.black, fontSize: 19.0),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class AppBar2 extends StatelessWidget {
  const AppBar2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: const Icon(Icons.keyboard_backspace),
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const HomePage()));
          },
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              "Admin",
              style: TextStyle(color: Colors.black45),
            ),
            Row(
              children: const [
                Icon(
                  Icons.phonelink,
                  color: Colors.black,
                ),
                Text(
                  "Sistemas, ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 19.0),
                ),
                Text(
                  "SSC ",
                  style: TextStyle(color: Colors.black, fontSize: 19.0),
                ),
              ],
            ),
          ],
        ),
        const CircleAvatar(
          backgroundImage: AssetImage(''),
          minRadius: 0,
        ),
      ],
    );
  }
}
