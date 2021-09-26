import 'package:flutter/material.dart';

void main() => runApp(new FormValidation());

class FormValidation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Form validation",
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String name;
  String phone;
  String id;
  String password;
  String orgCode;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(title: new Text("Guruphoria Login by PuneetShivaay")),
      body: new Container(
          padding: const EdgeInsets.all(20.0), child: formSetup(context)),
    );
  }

  Widget formSetup(BuildContext context) {
    return new Form(
      key: _formKey,
      child: new Column(
        children: <Widget>[
          new TextFormField(
            decoration:
                InputDecoration(hintText: "I'm awesome", labelText: "Name"),
            keyboardType: TextInputType.emailAddress,
            
            validator: (val) {
              if (val.length == 0)
                return "Please enter name";
              else
                return null;
            },
            onSaved: (val) => name = val,
          ),
          new TextFormField(
            decoration:
                InputDecoration(hintText: "123456789", labelText: "Phone"),
            keyboardType: TextInputType.phone,
            validator: (val) {
              if (val.length < 10 )
                return "Please enter valid Phone";
             
              else
                return null;
            },
            onSaved: (val) => phone = val,
          ),
          new TextFormField(
            decoration: InputDecoration(hintText: "AB123", labelText: "ID"),
            keyboardType: TextInputType.text,
            validator: (val) {
              if (val.length == 0)
                return "Please enter ID";
              else
                return null;
            },
            onSaved: (val) => id = val,
          ),
          new TextFormField(
            decoration:
                InputDecoration(hintText: "Password", labelText: "Password"),
            obscureText: true,
            validator: (val) {
              if (val.length == 0)
                return "Please enter password";
              else if (val.length <= 5)
                return "Your password should be more then 6 char long";
              else
                return null;
            },
            onSaved: (val) => password = val,
          ),
          new TextFormField(
            decoration: InputDecoration(
                hintText: "Organization", labelText: "Organization Code"),
            keyboardType: TextInputType.text,
            validator: (val) {
              if (val.length == 0)
                return "Please enter Organization Code";
              else
                return null;
            },
            onSaved: (val) => orgCode = val,
          ),
          new Padding(
            padding: const EdgeInsets.only(top: 20.0),
          ),
          new RaisedButton(
            child: new Text("Submit"),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                _scaffoldKey.currentState.showSnackBar(new SnackBar(
                  content: new Text(
                      "Your Name: $name , Phone: $phone , ID: $id , Password: ****** and Organization Code: :$orgCode"),
                ));
              }
              var jsonData = {
                          'name': name,
                          'phoneNumber': phone,
                          'id': id,
                          'password': password,
                          'orgCode': orgCode,
                        };
              print(jsonData);
            },
            color: Colors.blue,
            highlightColor: Colors.blueGrey,
          )
        ],
      ),
    );
  }
}
