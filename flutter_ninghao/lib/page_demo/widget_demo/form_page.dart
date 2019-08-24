import 'package:flutter/material.dart';
import '../../help.dart';

class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          elevation: 0.0,
          title: Text("Form Demo"),
        ),
        body: RegisterFormDemo(),
      ),
    );
  }
}


class RegisterFormDemo extends StatefulWidget {
  @override
  _RegisterFormDemoState createState() => _RegisterFormDemoState();
}

class _RegisterFormDemoState extends State<RegisterFormDemo> {
  final registerFormKey = GlobalKey<FormState>();

  String username, password;

  bool _autovalidateUsername = false;
  bool _autovalidatePassword = false;

  void _submitRegisteForm() {
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();

      debugPrint(username);
      debugPrint(password);
      FocusScope.of(context).requestFocus(FocusNode());
      
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Registering...'),
        )
      );
    } else {
      setState(() {
        _autovalidateUsername = true;
        _autovalidatePassword = true;
      });
    }
  }

  String _validateUsername(value) {
    if (value.isEmpty) {
      return "Username is required.";
    }
    return null;
  }

  String _validatePassword(value) {
    if (value.isEmpty) {
      return "Password is required.";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: registerFormKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              cursorColor: AppUtils.tinColor,
//              decoration: InputDecoration.collapsed(hintText: "Username"),
              enableInteractiveSelection: false,
              decoration: InputDecoration(
                labelText: "Username",
                helperText: "",
                fillColor: AppUtils.tinColor,
                contentPadding: const EdgeInsets.all(10.0),
                labelStyle: TextStyle(
                  color: AppUtils.tinColor,
                ),
              ),
              onSaved: (value) {
                username = value;
              },

              validator: _validateUsername,
              autovalidate: _autovalidateUsername,
            ),

            TextFormField(
              cursorColor: AppUtils.tinColor,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                helperText: "",
                fillColor: AppUtils.tinColor,
                contentPadding: const EdgeInsets.all(10.0),
                labelStyle: TextStyle(
                  color: AppUtils.tinColor,
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppUtils.tinColor,
                    style: BorderStyle.solid,
                    width: 1.0,
                  ),
                ),

              ),
              onSaved: (value) {
                password = value;
              },
              validator: _validatePassword,
              autovalidate: _autovalidatePassword,
            ),

            SizedBox(height: 32.0,),

            Container(
              width: double.infinity,
              child: RaisedButton(
                color: AppUtils.tinColor,
                child: Container(
                  alignment: Alignment.center,
                  height: 44.0,
                  child: Text('Register', style: TextStyle(color: Colors.white),),
                ),
                elevation: 0.0,
                onPressed: _submitRegisteForm,
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {

  final textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    textEditingController.text = "hihi";
    textEditingController.addListener(
        () {
          debugPrint("${textEditingController.text}");
        }
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: textEditingController,
              cursorColor: AppUtils.tinColor,
              decoration: InputDecoration(
                icon: Icon(Icons.subject),
                labelText: "Title",
                hintText: "Enter the post title.",
//              border: OutlineInputBorder(),
                filled: true,
              ),
//            onChanged: (value) {
//              debugPrint(value);
//            },
              onSubmitted: (value) {
                debugPrint(value);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}



