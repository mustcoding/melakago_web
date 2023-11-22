import 'package:flutter/material.dart';
import 'package:melakago_web/Model/userRole.dart';
import 'Model/appUser.dart';
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

  TextEditingController usernameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  void checkUser(email,password) async{
    String email = usernameController.text;
    String password = passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty ){
      Future<List<userRole>> user = appUser.getAppUser(email);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Center(child: const Text('Welcome To MelakaGo')),
        backgroundColor: Colors.lightGreen.shade700,
      ),
      body: SingleChildScrollView(
        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              SizedBox(height: 100),
              Image.network('https://img.freepik.com/premium-vector/vector-'
                  'famosa-malacca-historical-city_942441-43.jpg?w=740',
                width: 200,
                height: 200,
                //https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/
                // Flag_coat_of_Malacca_1946-1957.svg/772px-Flag_coat_of_
                // Malacca_1946-1957.svg.png
              ),
              Padding(
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
              Padding(
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
                  checkUser(email, password);
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
                      builder:(context)=>SystemAdmin(),
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

