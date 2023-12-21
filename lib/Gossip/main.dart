import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:gossip_gpt/model/imageDescription.dart';
import 'package:gossip_gpt/model/imageList.dart';
import 'package:gossip_gpt/model/textMessage.dart';
import 'animation/animasyon.dart';

void main() {
  runApp(MyApp());
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var textController = TextEditingController();
  String text = '';
  List<String> imageList = images.imageList;
  List<String> imageDescriptions = description.imageDescriptions;
  List<String> textMessages = textm.textMessages;
  List<String> messages = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/Digital-Abstract-Art-iPhone-Wallpaper.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.black,
                title: Text("W H I S P E R G P T"),
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(color: Colors.pink),
                ),
              ),
              SliverToBoxAdapter(
                child: MasonryGridView.builder(
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: imageList.length + textMessages.length + messages.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if (index < imageList.length) {
                      return Stack(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: FadeInImage.memoryNetwork(
                                placeholder:kTransparentImage,
                                image: imageList[index],
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
                                imageDescriptions[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      int contentIndex = index - imageList.length;
                      if (contentIndex < textMessages.length) {
                        return Stack(
                          children: [
                            Container(
                              color: Colors.purple,
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                textMessages[contentIndex],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        int messagesIndex = contentIndex - textMessages.length;
                        return Stack(
                          children: [
                            Container(
                              color: Colors.deepPurpleAccent,
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                messages[messagesIndex],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    }
                  },
                ),
              ),
            ],
          ),
          bottomNavigationBar: Row(
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
                    messages.add(text);
                  });
                },
                icon: Icon(Icons.send),
                color: Colors.purple,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
