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

class AppInfo{
  final String nome;
  final String descricao;
  final IconData icone;

  const AppInfo({
    required this.nome,
    required this.descricao,
    required this.icone,
  });
}

final List<AppInfo> meusApps=[
  AppInfo(
    nome:'Calculadora de Gasolina',
    descricao:'Calcula_litros e custo de uma viagem',
    icone: Icons.local_gas_station,
  ),

  AppInfo(
    nome: 'Calculadora de churrasco',
    descricao: 'Calcula carne, bebida e carvão',
    icone: Icons.outdoor_grill,
  )
];
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Align(
                alignment: AlignmentGeometry.bottomLeft,
                child: Text(
                  'Central de Apps',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Início'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Perfil'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sair'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.only(
          top: 80, // Espaço adicionado no topo para distanciar do título
          left: 16,
          right: 16,
          bottom: 16,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.95,
        ),
        itemCount: meusApps.length,
        itemBuilder: (context, indice) {
          final app = meusApps[indice];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    app.icone,
                    size: 36,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    app.nome,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    app.descricao,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}