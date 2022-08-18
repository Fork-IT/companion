// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:finaltwo/notes/extensions/date_format.dart';
import 'package:finaltwo/notes/models/note.dart';
import 'package:finaltwo/notes/pages/add_note_page.dart';
import 'package:permission_handler/permission_handler.dart';

import '../db/database_provider.dart';
import 'edit_note_page.dart';

class MainPage1 extends StatefulWidget {
  const MainPage1({Key? key}) : super(key: key);

  @override
  State<MainPage1> createState() => _MainPage1State();
}

class _MainPage1State extends State<MainPage1> {
  //GET ALL NOTEs

  getNotes() async {
    final notes = await DatabaseProvider.db.getNotes();
    return notes;
  }

  Future<bool> requestFilePermission() async {
    PermissionStatus result;
    result = await Permission.storage.request();
    if (result.isGranted) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    requestFilePermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan,
        elevation: 15,
        title: const Text(
          'Take Notes',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: "DynaPuff",
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan.shade600,
        onPressed: () async {
          await Navigator.push(context, buildCreateNotesScreen(context));
          setState(() {});
        },
        child: const Icon(Icons.note_add),
      ),
      body: FutureBuilder(
        future: getNotes(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            case ConnectionState.done:
              {
                if (snapshot.data == null) {
                  return const Center(
                    child: Text('You don\'t have any notes yet,\n \t \t \tTap " + " to create one.'),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(14),
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          String title = snapshot.data[index]['title'];
                          String body = snapshot.data[index]['body'];
                          String creationDate =
                              snapshot.data[index]['creationDate'];
                          var parsedDate = DateTime.parse(creationDate);
                          String formattedDate =
                              DateFormating.formatDate(parsedDate);

                          return Card(
                            child: ListTile(
                              contentPadding: EdgeInsets.all(14),
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return EditNotePage(
                                          note: NoteModel(
                                              id: snapshot.data[index]['id'],
                                              title: snapshot.data[index]
                                                  ['title'],
                                              body: snapshot.data[index]
                                                  ['body'],
                                              creationDate: DateTime.parse(
                                                  snapshot.data[index]
                                                      ['creationDate'])));
                                    },
                                  ),
                                );
                                setState(() {});
                              },
                              title: Text(
                                title,
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                              subtitle: Text(
                                body,
                                maxLines: 2,
                              ),
                              trailing: Text(
                                'Created On \n$formattedDate',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 100, 100, 100),
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                }
              }
            default:
              return const Text('Nothing here');
          }
        },
      ),
    );
  }

  buildCreateNotesScreen(BuildContext context) {
    return MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) {
          return AddNotePage();
        });
  }
}
