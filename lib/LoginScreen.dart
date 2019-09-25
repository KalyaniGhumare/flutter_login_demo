import 'package:flutter/material.dart';
import 'package:login_demo/SignUpScreen.dart';

class LoginScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            /*
            * Text Welcome
            * */
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 50.0),
              child: Text(
                'Welcome',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 24.0),
              ),
            ),
            /*
            * TextFormField
            * Username
            * */
            SizedBox(height: 40.0),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(fontSize: 18.0)
              ),
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.normal),
            ),
            SizedBox(height: 15.0),
            /*
            * TextFormField
            * Password
            * */
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(fontSize: 18.0)
              ),
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.normal),
            ),
            SizedBox(
              height: 30.0,
            ),
            ButtonTheme(
              height: 46.0,
              minWidth: 200.0,
              child: RaisedButton(
                color: Colors.orange[500],
                onPressed: (){},
                child: Text('LOGIN',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            /*
            * Create Account
            * */
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => SignUpScreen()
                        ));
                      },
                        child: Text('Create a new Account',
                          style: TextStyle(fontSize: 20.0,
                              fontStyle: FontStyle.normal,
                              color: Colors.black),)),
                    SizedBox(height: 10.0),
                    ButtonTheme(
                      height: 46.0,
                      minWidth: 200.0,
                      child: RaisedButton(
                        onPressed: (){

                        },
                        color: Colors.orange[500],
                        child: Text('Create Account',
                        style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}