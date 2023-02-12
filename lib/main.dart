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
      title: 'Contador Progresivo',
      theme: ThemeData(
        fontFamily: 'Monserrat',
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Contador Progresivo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String imageSelected = "assets/images/fondopantalla.jpeg";
  String image01 = "assets/images/fondopantalla.jpeg";
  String image02 = "assets/images/fondopantalla2.jpg";
  int _selectedIndex = 0;
  int _maxCountinf = 0;

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _clearCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _onItemCliqueado(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _selectingImage(String image) {
    setState(() {
      imageSelected = image;
    });
  }

  void _CounterLimit(String counterValue) {
    setState(() {
      _maxCountinf = int.parse(counterValue);
    });
  }

  void _seleccion() {
    setState(() {
      _selectedIndex = 0;
      _counter = _maxCountinf;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _SelectecWidget = <Widget>[
      Column(
        children: [
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: const Text(
                  "Cambiar Fondo",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => _selectingImage(image01),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 45.0,
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundImage:
                            Image.asset("assets/images/fondopantalla.jpeg")
                                .image,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _selectingImage(image02),
                    child: CircleAvatar(
                      radius: 45.0,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundImage:
                            Image.asset("assets/images/fondopantalla2.jpg")
                                .image,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Column(
              children: [
                Text(
                  "${_counter}",
                  style: TextStyle(fontSize: 90.0, color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _decrementCounter,
                      child: Text(
                        "-",
                        style: TextStyle(fontSize: 50.0, color: Colors.white),
                      ),
                      style:
                          ElevatedButton.styleFrom(shape: const CircleBorder()),
                    ),
                    ElevatedButton(
                      onPressed: _clearCounter,
                      child: const Text(
                        "Limpiar",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(100, 100),
                          shape: const CircleBorder()),
                    ),
                    ElevatedButton(
                      onPressed: _incrementCounter,
                      child: const Text(
                        "+",
                        style: TextStyle(fontSize: 50.0, color: Colors.white),
                      ),
                      style:
                          ElevatedButton.styleFrom(shape: const CircleBorder()),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(0, 200, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Cuanto va a Incrementar?",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                hintText: '1,2,3,4,5,6',
                hintStyle: TextStyle(color: Colors.grey),
              ),
              onChanged: (value) => {_CounterLimit(value)},
            ),
            ElevatedButton(
              onPressed: _seleccion,
              child: const Text(
                "Mostrar",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(100, 100), shape: const CircleBorder()),
            )
          ],
        ),
      )
    ];

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(imageSelected).image,
              ),
            ),
          ),
          Positioned(
            top: 90.0,
            left: 0.0,
            right: 0.0,
            child: _SelectecWidget.elementAt(_selectedIndex),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Theme(
                data:
                    Theme.of(context).copyWith(canvasColor: Colors.transparent),
                child: BottomNavigationBar(
                  elevation: 0.0,
                  fixedColor: Colors.white,
                  currentIndex: _selectedIndex,
                  onTap: _onItemCliqueado,
                  unselectedItemColor: Colors.white24,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        label: 'Contador'),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        label: 'Configuraciones'),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
