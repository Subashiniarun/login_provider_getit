import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_provider_architecture/contact_us/Contact_items.dart';

class ContactModel extends ChangeNotifier {

  ContactItem _name = ContactItem("", "");
  ContactItem _email = ContactItem("", "");
  ContactItem _body = ContactItem("", "");
  ContactItem _sub = ContactItem("", "");


  //Getters
  ContactItem get name => _name;
  ContactItem get email => _email;
  ContactItem get body => _body;
  ContactItem get sub => _sub;
  //List<String> attachent = <String>[];



  // Setters
  String changeName(String value) {
    if (value.length >= 3) {
      _name =  ContactItem(value, "");
    } else {
      _name = ContactItem(value, "Must be at least 3 characters");
    }
    notifyListeners();
    return value;
  }

  String changeEmail(String value) {
    if (value.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
      _email = ContactItem(value, "Enter valid mail id");

    } else {
      _email = ContactItem(value, "");

    }
    notifyListeners();
    return value;
  }

  String changesSub(String value) {
    if (value.length >= 5) {
      _sub = ContactItem(value, "");
    } else {
      _sub = ContactItem(value, "Must be at least 5 characters");
    }
    notifyListeners();
    return value;
  }

  String changeBody(String value) {
    if (value.length >= 10) {
      _body = ContactItem(value, "");
      print("$body");
    } else {
      _body = ContactItem(value, "Must be at least 10 characters");
    }
    notifyListeners();
    return value;
  }

  /*void _onCreateFile(BuildContext context) async {
    final TempFile tempFile = await _showDialog(context);
    final File newFile = await writeFile(tempFile.content, tempFile.name);
    setState(() {
      attachment.add(newFile.path);
    });
  }*/

  Future<void> send() async {
    /*if (Platform.isIOS) {
      final bool canSend = await FlutterEmailSender.canSendMail();
      if (!canSend) {
        const SnackBar snackbar =
        const SnackBar(content: Text('no Email App Available'));
        _scafoldKey.currentState.showSnackBar(snackbar);
        return;
      }
    }*/

    // Platform messages may fail, so we use a try/catch PlatformException.
    print("Body : ${_body.value}");
    print("email : ${_email.value}");

    final Email email = Email(
      body: _body.value.toString(),
      subject: _sub.value.toString(),
      recipients: <String>[_email.value.toString()],
      cc: ['arunsuba157@gmail.com'],
     // bcc: ['arunsuba157@gmail.com'],
      //attachmentPaths: ['/path/to/attachment.zip'],
      isHTML: false,
    );
    return await FlutterEmailSender.send(email);

  }
  notifyListeners();

}