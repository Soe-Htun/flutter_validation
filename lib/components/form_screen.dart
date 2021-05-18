import 'package:flutter/material.dart';
import 'package:flutter_validation/constants.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  
  String _name;
  String _email;
  String _password;
  String _url;
  String _phoneNumber;
  String _calories;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Name'
      ),
      maxLength: 25,
      validator: (String value){
        if(value.isEmpty){
          return 'Name is required';
        }
      },
      onSaved: (String value){
        _name = value;
      }
    );
  }

  Widget _buildEmail(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email'
      ),
      validator: (String value){
        if(value.isEmpty){
          return 'Email is required';
        }
        if(!RegExp
          (r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)){
          return "Please enter a valid email address";
        }
        return null;
      },
      onSaved: (String value){
        _email = value;
      },
    );
  }

  Widget _buildPassword(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password'
      ),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value){
        if(value.isEmpty){
          return 'Password is required';
        }
      },
      onSaved: (String value){
        _password = value;
      }
    );
  }

  // Widget _buildUrl(){
  //   return TextFormField(
  //     decoration: InputDecoration(
  //       labelText: 'Url'
  //     ),
  //     keyboardType: TextInputType.url,
  //     validator: (String value){
  //       if(value.isEmpty){
  //         return 'Url is required';
  //       }
  //     },
  //     onSaved: (String value){
  //       _url = value;
  //     }
  //   );
  // }

  Widget _buildPhoneNumber(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Phone Number'
      ),
      keyboardType: TextInputType.phone,
      validator: (String value){
        if(value.isEmpty){
          return 'Phone number is required';
        }
      },
      onSaved: (String value){
        _phoneNumber = value;
      }
    );
  }

  Widget _buildCalories(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Calories'
      ),
      keyboardType: TextInputType.number,
      validator: (String value){

        int calories = int.tryParse(value);

        if(calories == null || calories <= 0){
          return 'Calories must be greater than 0';
        }
      },
      onSaved: (String value){
        _calories = value;
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Demo"),
      ),
      body: Container(
        // margin: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget> [
              _buildName(),
              _buildEmail(),
              _buildPassword(),
              _buildPhoneNumber(),
              // _buildUrl(),
              _buildCalories(),

              SizedBox(height: 20),

              RaisedButton(
                child: Text("Submit",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 16
                  ),
                ),
                onPressed: (){
                  if(!_formKey.currentState.validate()){
                    return;
                  }

                  _formKey.currentState.save();

                  print(_name);
                  print(_email);
                  print(_password);
                  // print(_url);
                  print(_phoneNumber);
                  print(_calories);
                } ,
              )
            ],
          ),
        ),
      ),
    );
  }
}