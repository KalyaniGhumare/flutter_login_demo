import 'package:flutter/material.dart';
import 'package:login_demo/LoginScreen.dart';
import 'package:login_demo/TextFormFieldWidget.dart';

class SignUpScreen extends StatelessWidget
{
  /*
  * Global Instance of FormKey
  * */
  static final GlobalKey<FormState> keyForm = new GlobalKey();
  /*
  * Global Instance of Controller
  * */
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController mobileController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController pwdController = new TextEditingController();
  final TextEditingController confirmPwdController = new TextEditingController();

  /*
  * Global Instance of FocusNode
  * */
  FocusNode fullNameFocus = new FocusNode();
  FocusNode mobileFocus = new FocusNode();
  FocusNode emailFocus = new FocusNode();
  FocusNode passwordFocus = new FocusNode();
  FocusNode confirmPwdFocus = new FocusNode();

  String password;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Account',
        style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: keyForm,
          child: Column(
            children: <Widget>[
              TextFormFieldWidget(
                labelName: 'Full Name',
                focusNode: fullNameFocus,
                controller: nameController,
                errorMsg: 'Please Enter Full Name',
                textInputAction: TextInputAction.next,
                nextFocusNode: mobileFocus,
              ),
              TextFormFieldWidget(
                labelName: 'Mobile Number',
                focusNode: mobileFocus,
                controller: mobileController,
                errorMsg: 'Please Enter Mobile Number',
                textInputAction: TextInputAction.next,
                nextFocusNode: emailFocus,
              ),
              TextFormFieldWidget(
                labelName: 'Email',
                focusNode: emailFocus,
                controller: emailController,
                errorMsg: 'Please Enter Email',
                textInputAction: TextInputAction.next,
                nextFocusNode: passwordFocus,
              ),
              /*TextFormField(
                autofocus: true,
                controller: nameController,
                decoration: InputDecoration(
                    labelText: 'Full Name',
                    labelStyle: TextStyle(fontSize: 18.0)
                ),
                textCapitalization: TextCapitalization.none,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.normal),
                validator: (value){
                  if(value.isEmpty)
                  {
                    return 'Enter Full Name';
                  }
                  return null;
                },
                onFieldSubmitted: (value){
                  FocusScope.of(context).
                    requestFocus(mobileFocus);
                },
              ),
              TextFormField(
                focusNode: mobileFocus,
                controller: mobileController,
                decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    labelStyle: TextStyle(fontSize: 18.0)
                ),
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.none,
                textInputAction: TextInputAction.next,
                style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.normal),
                validator: (value){
                  if(value.isEmpty)
                  {
                    return 'Enter Mobile Number';
                  }
                  return null;
                },
                onFieldSubmitted: (value){
                  FocusScope.of(context)
                      .requestFocus(emailFocus);
                },
              ),
              TextFormField(
                focusNode: emailFocus,
                controller: emailController,
                decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(fontSize: 18.0)
                ),
                validator: (value)
                {
                  if(value.isEmpty)
                  {
                    return 'Please Enter Email';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.none,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.normal),
                onFieldSubmitted: (value){
                  FocusScope.of(context).requestFocus(passwordFocus);
                },
              ),*/
              TextFormField(
                focusNode: passwordFocus,
                controller: pwdController,
                decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(fontSize: 18.0)
                ),
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.none,
                keyboardType: TextInputType.visiblePassword,
                onFieldSubmitted: (value) {
                  FocusScope.of(context)
                      .requestFocus(confirmPwdFocus);
                },
                onChanged: (value)
                {
                  password = value;
                },
                validator: (value)
                {
                  if(value.isEmpty)
                  {
                    return 'Please Enter Password';
                  }
                  return null;
                },
                style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.normal),
              ),
              TextFormField(
                focusNode: confirmPwdFocus,
                controller: confirmPwdController,
                decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    labelStyle: TextStyle(fontSize: 18.0)
                ),
                textInputAction: TextInputAction.done,
                textCapitalization: TextCapitalization.none,
                keyboardType: TextInputType.visiblePassword,
                validator: (value)
                {
                  if(value.isEmpty)
                    {
                      return 'Please Enter Confirm Password';
                    }
                  else if(password != value)
                    {
                      return 'Please Confirm your password!';
                    }
                  return null;
                },
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
                  onPressed: (){
                    bool validate = keyForm.currentState.validate();
                    if(validate)
                    {
                      createNewAccount();
                    }
                    else
                    {
                      print('Empty Field');
                    }
                  },
                  child: Text('SIGN UP',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: ()
                        {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => LoginScreen()
                          ));
                        },
                        child: Text(
                          'Already have an account?',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }

  void createNewAccount()
  {
    String name = nameController.text;
    String mobile = mobileController.text;
    String email = emailController.text;
    String password = pwdController.text;
    String confirmPwd = confirmPwdController.text;

    print(name);
    print(mobile);
    print(email);
    print(password);
    print(confirmPwd);

    /*
    * (Flutter Handler)
    * After 2 sec clear TextField
    * */
    Future.delayed(new Duration(seconds: 2), (){
      nameController.clear();
      mobileController.clear();
      emailController.clear();
      pwdController.clear();
      confirmPwdController.clear();
    });
  }
}
