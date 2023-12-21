import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:gossip_gpt/model/imageDescription.dart';
import 'package:gossip_gpt/model/imageList.dart';
import 'package:gossip_gpt/model/textMessage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animationController.forward(); // Start the animation

    Future.delayed(Duration(seconds: 2), () {
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
                (_animationController.value * MediaQuery.of(context).size.width) - MediaQuery.of(context).size.width / 2,
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> imageList = images.imageList;
  List<String> imageDescriptions = description.imageDescriptions;
  List<String> textMessages = textm.textMessages;
  List<String> messages = [];
  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text("Flutter MasonryGridView Demo"),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: MasonryGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        itemCount: imageList.length + textMessages.length + messages.length,
        itemBuilder: (context, index) {
          if (index % 2 == 0 && index < imageList.length * 2) {
            // Resimler
            final imageIndex = index ~/ 2;
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: imageList[imageIndex],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      imageDescriptions[imageIndex],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (index < (imageList.length + textMessages.length) * 2) {
            // Metinler
            final textIndex = (index - 1) ~/ 2;
            return Container(
              color: Colors.purple,
              padding: const EdgeInsets.all(8),
              child: Text(
                textMessages[textIndex],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            );
          } else {
            // Kullanıcı mesajları
            return Container(
              color: Colors.deepPurpleAccent,
              padding: const EdgeInsets.all(8),
              child: Text(
                messages[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextField(
                  controller: _textFieldController,
                  decoration: InputDecoration(
                    hintText: 'Enter your text here',
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String enteredText = _textFieldController.text;
                _textFieldController.clear();
                setState(() {
                  messages.add(enteredText);
                  print('Entered Text: $enteredText');
                });
              },
              child: Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }
}
