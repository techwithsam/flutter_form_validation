import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Beginner Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phn = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _cpass = TextEditingController();
  var _formKey = GlobalKey<ScaffoldState>();
  bool hidePass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      appBar: AppBar(
        title: Text('Simple Form Validation'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  'Register Page',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _name,
                      decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: 'Full Name',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        icon: Icon(Icons.mail),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _phn,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        icon: Icon(Icons.call),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _pass,
                      obscureText: hidePass,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        icon: Icon(Icons.security),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {
                            showandhide();
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      obscureText: hidePass,
                      controller: _cpass,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        icon: Icon(Icons.border_color),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {
                            showandhide();
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      width: 300,
                      child: MaterialButton(
                        onPressed: () {
                          formValidate(
                            name: _name.text,
                            email: _email.text,
                            cpass: _cpass.text,
                            pass: _pass.text,
                            phn: _phn.text,
                          );
                        },
                        child: Text(
                          'Submit Form',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showandhide() {
    setState(() {
      hidePass = !hidePass;
    });
  }

  void _showInSnackBar({String message}) {
    _formKey.currentState.showSnackBar(
      SnackBar(
        content: GestureDetector(
          onTap: () {},
          child: Text(
            message,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        duration: (Duration(seconds: 4)),
        elevation: 0,
        backgroundColor: Colors.black,
      ),
    );
  }

  formValidate({name, email, phn, pass, cpass}) {
    if (name.toString().isEmpty) {
      _showInSnackBar(message: 'Full name required');
    } else if (email.toString().isEmpty) {
      _showInSnackBar(message: 'Invalid email address');
    } else if (phn.toString().isEmpty) {
      _showInSnackBar(message: 'Invalid phone number');
    } else if (pass.toString().isEmpty || pass.length != 8) {
      _showInSnackBar(message: '8 character required for password');
    } else if (cpass.toString() != pass.toString()) {
      _showInSnackBar(message: 'Password does not match');
    } else {
      openDia(name: name);
    }
  }

  openDia({String name}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('$name is now a verified account'),
            title: Text('Registration Successful'),
            actions: <Widget>[
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Verified',
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          );
        });
  }

  @override
  void initState() {
    _name = TextEditingController();
    _email = TextEditingController();
    _phn = TextEditingController();
    _pass = TextEditingController();
    _cpass = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _phn.dispose();
    _pass.dispose();
    _cpass.dispose();
    super.dispose();
  }
}
