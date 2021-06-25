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
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


    return ChangeNotifierProvider<ContactModel>(
        create: (context)=>locator<ContactModel>(),
      child: Consumer<ContactModel>(
          builder: (_,model,__)=>
        Scaffold(

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
                      decoration: InputDecoration(
                      filled: true,
                        labelText: "Name",
                        errorText: model.name.error ,//model.changeName()
                        border: InputBorder.none
                      ),
                      onChanged: (String value){
                        model.name;//Provider.of<ContactModel>(context).changeName(value);

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
                      decoration: InputDecoration(
                          filled: true,
                          labelText: "Email",
                          errorText: model.email.error,//Provider.of<ContactModel>(context).email.error,
                          border: InputBorder.none
                      ),
                      onChanged: (String value){
                        model.email;
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
                      decoration: InputDecoration(
                          filled: true,
                          labelText: "subject",
                          errorText: model.sub.error,//Provider.of<ContactModel>(context).message.error,
                          border: InputBorder.none
                      ),
                      onChanged: (String value){
                        model.sub;
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
                      decoration: InputDecoration(
                          filled: true,
                          labelText: "body",
                          errorText: model.body.error,//Provider.of<ContactModel>(context).message.error,
                          border: InputBorder.none
                      ),
                      onChanged: (String value){
                        model.body;
                        //Provider.of<ContactModel>(context).changeMessage(value);

                      },
                    ),
                  ),
                  MaterialButton(onPressed: ()=> model.send(),
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