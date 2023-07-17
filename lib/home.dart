import 'package:contact_list/contact.dart';
import 'package:flutter/material.dart';

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  List<Contact> contacts = List.empty(growable: true);
  int selectedIndex = -1;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 183, 17, 225),
        centerTitle: true,
        title: const Text("Contacts List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(10)),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Contact Name",
                hintStyle: const TextStyle(fontSize: 20),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),

            TextField(
              controller: contactController,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Contact Number",
                hintStyle: const TextStyle(fontSize: 20),
              ),
            ),
            // ),

            const Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 70,
                  height: 40,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: ElevatedButton(
                    onPressed: () {
                      String name = nameController.text.trim();
                      String contact = contactController.text.trim();
                      if (name.isNotEmpty && contact.isNotEmpty) {
                        setState(() {
                          nameController.text = '';
                          contactController.text = '';
                          contacts.add(Contact(name: name, contact: contact));
                        });
                      }
                    },
                    child: const Text(
                      "save",
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 183, 17, 225),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(30)),
                Container(
                  width: 90,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      String name = nameController.text.trim();
                      String contact = contactController.text.trim();
                      if (name.isNotEmpty && contact.isNotEmpty) {
                        setState(() {
                          nameController.text = '';
                          contactController.text = '';
                          contacts[selectedIndex].name = name;
                          contacts[selectedIndex].contact = contact;
                        });
                        selectedIndex = -1;
                      }
                    },
                    child: const Text(
                      "Update",
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 183, 17, 225),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            contacts.isEmpty
                ? const Text(
                    "No contact yet",
                    style: TextStyle(fontSize: 22, color: Colors.purple),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (context, index) => getRow(index),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(contacts[index].name),
            Text(contacts[index].contact),
          ],
        ),
        leading: CircleAvatar(
          backgroundColor:
              index % 2 == 0 ? Colors.deepPurple : Colors.purpleAccent,
          child: Text(
            contacts[index].name[0],
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        trailing: SizedBox(
          width: 70,
          child: Row(
            children: [
              InkWell(
                child: Icon(Icons.edit),
                onTap: () {
                  setState(() {
                    nameController.text = contacts[index].name;
                    contactController.text = contacts[index].contact;
                    selectedIndex = index;
                  });
                },
              ),
              Padding(padding: EdgeInsets.all(10)),
              InkWell(
                onTap: () {
                  setState(() {
                    contacts.removeAt(index);
                  });
                },
                child: Icon(Icons.delete),
              )
            ],
          ),
        ),
      ),
    );
  }
}
