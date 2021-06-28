import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/shared/ui_helpers.dart';
import 'package:provider/provider.dart';
import '../locator.dart';
import 'contactus_model.dart';

class ContactPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final TextEditingController _name = TextEditingController();
    final TextEditingController _email = TextEditingController();
    final TextEditingController _body = TextEditingController();
    final TextEditingController _sub = TextEditingController();
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    var submit;


    return ChangeNotifierProvider<ContactModel>(
        create: (context)=>locator<ContactModel>(),
      child: Consumer<ContactModel>(
          builder: (_,model,__)=>
        Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Color(0xffeeeeee),
        body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Contact us", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  UIHelper.verticalSpaceMedium(),

                  Card(
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 25.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    color: Colors.white54,
                    child:TextFormField (
                      controller: _name,
                      decoration: InputDecoration(
                      filled: true,
                        labelText: "Name",
                        errorText: model.name.error,
                        border: InputBorder.none
                      ),
                      onChanged: (String value){
                        model.changeName(_name.text);

                        //Provider.of<ContactModel>(context).changeName(value);

                      },
                    ),
                  ),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 25.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    color: Colors.white54,
                    child:TextFormField (
                      controller: _email,

                      decoration: InputDecoration(
                          filled: true,
                          labelText: "Email",
                          errorText: model.email.error,//Provider.of<ContactModel>(context).email.error,
                          border: InputBorder.none
                      ),
                      onChanged: (String value){
                        model.changeEmail(_email.text);
                        //Provider.of<ContactModel>(context).changeName(value);

                      },
                    ),
                  ),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 25.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    color: Colors.white54,
                    child:TextFormField (
                      controller: _sub,

                      decoration: InputDecoration(
                          filled: true,
                          labelText: "subject",
                          errorText: model.sub.error,//Provider.of<ContactModel>(context).message.error,
                          border: InputBorder.none
                      ),
                      onChanged: (String value){
                        model.changesSub(_sub.text);
                        //Provider.of<ContactModel>(context).changeMessage(value);

                      },
                    ),
                  ),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 25.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    color: Colors.white54,
                    child:TextFormField (
                      controller: _body,
                      decoration: InputDecoration(
                          filled: true,
                          labelText: "body",
                          errorText: model.body.error,//Provider.of<ContactModel>(context).message.error,
                          border: InputBorder.none
                      ),
                      onChanged: (String value){
                        model.changeBody(_body.text);
                        //Provider.of<ContactModel>(context).changeMessage(value);

                      },
                    ),
                  ),
                  MaterialButton(onPressed: (){
                    if (_name !=null && _email !=null && _body !=null && _sub !=null){
                      print(" $_name \n $_email \n $_sub \n  $_body");
                      submit = model.send();

                      return submit;

                    }else {
                      print("Fill the items");
                      return null;
                    }

                  },
                    color: Colors.white38,
                  child: Text(
                    "Submit", style: TextStyle(fontSize: 12),
                  ),)
                ],
              ),
            ),
          ),
      ),
    ));
  }
}