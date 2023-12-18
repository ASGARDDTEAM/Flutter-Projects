import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    _animationController.forward(); // Start the animation

    Future.delayed(Duration(seconds: 5), () {
      _animationController.reset(); // Reset the animation
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 144, 223),
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(
                (_animationController.value *
                    MediaQuery.of(context).size.width) -
                    MediaQuery.of(context).size.width / 2,
                0.0,
              ),
              child: child,
            );
          },
          child: Image.asset(
            'images/witch_image.png',
            width: 300.0,
            height: 300.0,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

Container textPrinter(String message) {
  return Container(
    color: Color.fromARGB(255, 255, 81, 210),
    child: Text(
      message,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textController = TextEditingController();
  String text = '';
  int i = 0;
  List<Container> containerList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView( // Wrap your Column with SingleChildScrollView
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "WhisperGPT",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              MasonryGridView.builder(
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                physics: AlwaysScrollableScrollPhysics(), // Make the grid scrollable
                itemCount: i,
                shrinkWrap: true,
                itemBuilder: ((context, i) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: containerList[i],
                )),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: textController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Buraya yazın",
                          suffixIcon: IconButton(
                            onPressed: () {
                              textController.clear();
                            },
                            icon: Icon(Icons.clear),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        text = textController.text;
                        textController.clear();
                        containerList.add(textPrinter(text));
                        print(containerList);
                        i++;
                      });
                    },
                    icon: Icon(Icons.send),
                    color: Colors.purple,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}