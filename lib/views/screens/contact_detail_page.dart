import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/globals.dart';
import '../components/my_back_button.dart';

class ContactDetailPage extends StatefulWidget {
  const ContactDetailPage({Key? key}) : super(key: key);

  @override
  State<ContactDetailPage> createState() => _ContactDetailPageState();
}

class _ContactDetailPageState extends State<ContactDetailPage> {
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        leading: const MyBackButton(),
        title: Text("Contact"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CircleAvatar(
              radius: 50,
              foregroundImage: FileImage(Globals.allContacts[index].image!),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              Globals.allContacts[index].name,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              Globals.allContacts[index].contact,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              Globals.allContacts[index].email,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () async {
                    Uri call = Uri(
                      scheme: 'tel',
                      path: Globals.allContacts[index].contact,
                    );
                    try {
                      await launchUrl(call);
                    } on MissingPluginException {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              const Text("Please restrats the application !!"),
                        ),
                      );
                    } catch (e) {}
                  },
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.call),
                ),
                FloatingActionButton(
                  onPressed: () async {
                    Uri mail = Uri(
                      scheme: 'mailto',
                      query:
                          "subject=This is demo mail&body=Dear ${Globals.allContacts[index].name},\n\tHere I've sent a demo mail from flutter testing software.",
                      path: Globals.allContacts[index].email,
                    );

                    await launchUrl(mail);
                  },
                  backgroundColor: Colors.cyan,
                  child: const Icon(Icons.email),
                ),
                FloatingActionButton(
                  onPressed: () async {
                    Uri sms = Uri(
                      scheme: 'sms',
                      query:
                          "body=Dear ${Globals.allContacts[index].name},\n\tHere I've sent a demo mail from flutter testing software.",
                      path: Globals.allContacts[index].contact,
                    );

                    await launchUrl(sms);
                  },
                  backgroundColor: Colors.lightBlue,
                  child: const Icon(Icons.message),
                ),
                FloatingActionButton(
                  onPressed: () {
                    Share.shareXFiles(
                        [XFile(Globals.allContacts[index].image!.path)],
                        text:
                            "Name: ${Globals.allContacts[index].name}\nContact: ${Globals.allContacts[index].contact}\nEmail: ${Globals.allContacts[index].email}\n\nShared from ContactDiaryApp.");
                  },
                  backgroundColor: Colors.deepPurpleAccent,
                  child: const Icon(Icons.share),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
