import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formkey=GlobalKey<FormState>();

  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  FocusNode nameFocusNode=FocusNode();
  FocusNode emailFocusNode=FocusNode();
  FocusNode passwordFocusNode=FocusNode();

  var result="";


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              //-----EditText Box----------
              TextFormField(
                controller: nameController,
                focusNode: nameFocusNode,
                maxLines: 1,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Name",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  )
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return ("Please Enter Your Name");
                  }
                  return null;
                },
              ),
              //------EditText Box----------------
              SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                focusNode: emailFocusNode,
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    )
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return ("Please Enter Your Email");
                  }
                  return null;
                },
              ),
              //------EditText Box----------------
              SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                focusNode: passwordFocusNode,
                textInputAction: TextInputAction.done,
                maxLines: 1,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Password",
                    suffix: Icon(Icons.password),
                    prefixIcon: Icon(Icons.remove_red_eye),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    )
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return ("Please Enter Your Password");
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: (){
                    if(!_formkey.currentState!.validate()){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please Input All The Faild')),
                      );
                    }
                    print("Name: ${nameController.text}");
                    print("Email: ${emailController.text}");
                    print("Password: ${passwordController.text}");

                    setState(() {
                      result="Name: ${nameController.text} Email: ${emailController.text} Password: ${passwordController.text}";
                    });
                  },
                  child: Text("Submit Form")
              ),
              SizedBox(height: 10),
              Text("${result}"),


            ],


          ),

        ),
      ),

    );
  }
}
