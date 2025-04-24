import 'package:college/third.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Username",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "email",
                  border: OutlineInputBorder(),
                ),
                validator: (value){
                  if(emailRegex.hasMatch(value!)){

                  }else{
                    return "email is not formated correctly";
                  }
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "password",
                  border: OutlineInputBorder(),
                ),
                
                validator: (value){
                  if(value!.length<5){
                    return "password must be atleast 6 of characters";
                  }else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Form Submitted Successfully')),
                  );
                }
              }, 
                  child: Text('submit'),
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => ThirdPage()));
              }, child: Text('Third Page'),),
              
            ],
          ),
        ),
      ),
    );
  }
}
