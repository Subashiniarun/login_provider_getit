import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/loginmodel.dart';
import 'package:flutter_provider_architecture/widgets/login_header.dart';
import 'package:provider/provider.dart';
import 'contact_us/contact_page.dart';
import 'locator.dart';
class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  _LoginViewState createState() => _LoginViewState();
}
class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginModel>(create: (context)=>locator<LoginModel>(),
      child: Consumer<LoginModel>(
        builder: (_,model,__)=>
            Scaffold(
                backgroundColor: Color(0xffeeeeee),
            body:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginHeader(
                  controller: _controller, validationMessage: model.errorMessage,
                ),
                model.state == ViewState.Busy
                    ?Center(child: CircularProgressIndicator(),)
                    :TextButton(onPressed: () async {
                  var loginSuccess = await model.login(_controller.text);
                  if(loginSuccess){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContactPage()),
                    );
                    //navigate to home page
                  }
                },
                  child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 80.0,),
                        height: 50.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.grey[400], borderRadius: BorderRadius.circular(10.0)),
                      child: Text("Sign in",style: TextStyle(color: Colors.black),)),)
              ],
            )

        ),
      ),
    );
  }
}
