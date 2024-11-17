import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../routes/routes.dart';
import '../../utils/globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Call App"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.light_mode),
          ),
        ],
      ),
      body: (Globals.allContacts.isNotEmpty)
          ? Padding(
              padding: const EdgeInsets.all(18),
              child: Scrollbar(
                interactive: true,
                thickness: 10,
                radius: const Radius.circular(50),
                child: Column(
                  children: [
                    Expanded(
                      flex: 13,
                      child: ListView.builder(
                        itemCount: Globals.allContacts.length,
                        itemBuilder: (context, index) => Slidable(
                          closeOnScroll: true,
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (val) {},
                                icon: Icons.call,
                                backgroundColor: Colors.green,
                              ),
                              SlidableAction(
                                onPressed: (val) async {
                                  await Navigator.of(context).pushNamed(
                                      Routes.editpage,
                                      arguments: index);
                                  setState(() {});
                                },
                                icon: Icons.edit,
                                backgroundColor: Colors.blue,
                              ),
                            ],
                          ),
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  Routes.detailspage,
                                  arguments: index);
                            },
                            leading: CircleAvatar(
                              backgroundColor:
                                  Colors.primaries[index % 18].shade200,
                              foregroundImage:
                                  FileImage(Globals.allContacts[index].image!),
                              child: Text("${index + 1}"),
                            ),
                            title: Text("${Globals.allContacts[index].name}"),
                            subtitle:
                                Text("${Globals.allContacts[index].contact}"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const Center(
              child: Text("No contacts yet !!"),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed(Routes.addpage);
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
