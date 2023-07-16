import 'package:flutter/material.dart';

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 183, 17, 225),
        centerTitle: true,
        title: Text("Contacts List"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Container(
              padding: EdgeInsets.all(10),
              width: 400.0,
              height: 70.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.grey,
                  width: 2.0,
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Contact Number", border: InputBorder.none),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Container(
              padding: EdgeInsets.all(10),
              width: 400.0,
              height: 70.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.grey,
                  width: 2.0,
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Contact Name", border: InputBorder.none),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(40)),
                Container(
                  width: 70,
                  height: 40,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("save"),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 183, 17, 225),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(40)),
                Container(
                  width: 90,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Update"),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 183, 17, 225),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
