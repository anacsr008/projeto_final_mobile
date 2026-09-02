import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'lêBrasil',
      theme: ThemeData(
       colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 185, 235, 255),
          primary: const Color.fromARGB(255, 71, 163, 200),   
          secondary: const Color(0xFF16A6C9),
          ), 
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  @override
  void initState() {
    //Geralmente, se diz as ações da página
    super.initState();
    Future.delayed(const Duration(seconds:3), () {//Aguardar 3 segundos e depois direcionar para a home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),    //trabalhar a pilha de navegação
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    //O conteudo visivel da página
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body:Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              '../assets/images/Logo_Principal.png',
              width: 150,
              height: 150,
            ),
            SizedBox(height: 16,),
            Text(
               'lêBrasil',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily:'Raleway',
              fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "lêBrasil",
          style: TextStyle(
            color: Color(0xFF1E1E1E),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFDDF4FF),
              Color(0xFFA1E5FF),
            ],
          ),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFBEEBFA),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Em construção...',
              style: TextStyle(
                color: Color(0xFF3B98B7),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}