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


  // Setters
  Future<void> changeName(String value) async{
    if (value.length >= 3) {
      _name = ContactItem(value, "");
    } else {
      _name = ContactItem(value, "Must be at least 3 characters");
    }
    notifyListeners();
  }

  void changeEmail(String value) {
    if (value.length >= 3) {
      _email = ContactItem(value, "");
    } else {
      _email = ContactItem(value, "Must be at least 3 characters");
    }
    notifyListeners();
  }

  void changesSub(String value) {
    if (value.length >= 5) {
      _sub = ContactItem(value, "");
    } else {
      _sub = ContactItem(value, "Must be at least 3 characters");
    }
    notifyListeners();
  }

  void changeMessage(String value) {
    if (value.length >= 100) {
      _body = ContactItem(value, "");
    } else {
      _body = ContactItem(value, "Must be at least 100 characters");
    }
    notifyListeners();
  }

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

    final Email email = Email(
      body: body.toString(),
      subject: sub.toString(),
      recipients: <String>['arunsuba157@gmail.com'],
      cc: ['arunsuba157@gmail.com'],
      bcc: ['arunsuba157@gmail.com'],
      attachmentPaths: ['/path/to/attachment.zip'],
      isHTML: false,
    );

    if (_name.value !=null && _email.value!=null && _body.value!=null && _sub.value!=null){

      return await FlutterEmailSender.send(email);

    }else {
      return null;
    }
  }
}