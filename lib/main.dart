import 'package:flutter/material.dart';

void main()=> runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: const LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
    );
  }
  }

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;

  @override
  void initState(){
    super.initState();
  _iconAnimationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200)
  );

  _iconAnimation = CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.easeOut
  );
  _iconAnimation.addListener(()=> setState(() { }));
  _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black26,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Image(
            image: AssetImage("images/sdy.jpg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
           Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(
                size: _iconAnimation.value*100,
              ),
              Form(
                child: Theme(
                  data: ThemeData(
                    brightness: Brightness.dark,primarySwatch: Colors.cyan,
                    inputDecorationTheme: const InputDecorationTheme(
                      labelStyle:TextStyle(
                        color: Colors.cyan,
                        fontSize: 20.0
                      )
                    )
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Enter your Email",

                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Enter your Password",

                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      const Padding(
                          padding: EdgeInsets.only(top: 40.0),
                      ),
                      MaterialButton(
                          height: 40.0,
                          minWidth: 100.0,
                          color: Colors.teal,
                          textColor: Colors.white,
                          onPressed: ()=>{},
                        splashColor: Colors.greenAccent,
                          child: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                  )
                )
              )
            ],
          )
        ],
      )
    );
  }
}