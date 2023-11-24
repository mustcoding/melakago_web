import 'package:flutter/material.dart';
import 'package:melakago_web/Model/appUser.dart';
import 'package:melakago_web/signUp.dart';
import 'systemAdmin.dart';

void main(){
  runApp(const MaterialApp(
    home:LoginScreen(),
  ));
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late final appUser user;
  TextEditingController usernameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Center(child: const Text('Welcome To MelakaGo',style: TextStyle(fontWeight: FontWeight.bold))),
        backgroundColor: Colors.lightGreen.shade700,
      ),
      body: SingleChildScrollView(
        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              SizedBox(height: 150),
              ClipOval(
                child: Image.asset(
                  'assets/images/MelakaGo.jpg',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover, // This ensures that the image covers the circular area
                ),
              ),
              SizedBox(height: 100),
              Container(
                  width:600,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email Address', // Your label text
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.0), // Add some space between the label
                      // and the text field
                      Container(
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: TextField(
                          controller: usernameController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width:600,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password', // Your label text
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.0), // Add some space between the label and the text field
                      Container(
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: TextField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SystemAdmin(),//ResetPasswordPage(),
                  ),
                );

              }, child: Text(
                'Forget Password?', style:TextStyle(
                color: Colors.blue,
              ),
              ),),
              ElevatedButton(
                onPressed:() async{
                  String email = usernameController.text;
                  String password = passwordController.text;
                  //checkUser(email, password);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreen.shade700, // Set your desired background color here
                ),
                child: const Text('Sign in', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
              SizedBox(height: 18),
              ElevatedButton(
                onPressed:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=>signUp(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreen.shade700, // Set your desired background color here
                ),
                child: const Text('Sign up', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ],

          ),
        ),
      ),
    );
  }
}

