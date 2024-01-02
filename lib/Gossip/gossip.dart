import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_project/Gossip/model/imageDescription.dart';
import 'package:flutter_project/Gossip/model/imageList.dart';
import 'package:flutter_project/Gossip/model/textMessage.dart';
import 'package:transparent_image/transparent_image.dart';

void main() {
  runApp(MaterialApp(home: Gossip()));
}

class Gossip extends StatefulWidget {
  @override
  State<Gossip> createState() => _GossipState();
}

class _GossipState extends State<Gossip> {
  var textController = TextEditingController();
  var textController2 = TextEditingController();
  List<String> containerList = [];
  String text = '';
  List<String> imageList = images.imageList;
  List<String> imageDescriptions = description.imageDescriptions;
  List<String> textMessages = textm.textMessages;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/Digital-Abstract-Art-iPhone-Wallpaper.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              setState(() {
                showModalBottomSheet(
                  enableDrag: true,
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 200,
                      color: Colors.pinkAccent,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller: textController2,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Buraya yazın",
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          textController2.clear();
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
                                    text = textController2.text;
                                    textController2.clear();
                                    containerList.add(text);
                                  });
                                },
                                icon: Icon(Icons.send),
                                color: Colors.purple,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
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
                                    containerList.add(text);
                                  });
                                },
                                icon: Icon(Icons.send),
                                color: Colors.purple,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Text(
                                    "buraya resim yürkleme",
                                    style: TextStyle(
                                      fontSize: 40.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    "Buraya da resim seçme",
                                    style: TextStyle(fontSize: 40, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              });
            },
          ),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.black,
                title: Text(
                  "W H I S P E R G P T",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(color: Color.fromARGB(255, 255, 37, 201)),
                ),
              ),
              SliverToBoxAdapter(
                child: MasonryGridView.builder(
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: imageList.length + textMessages.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if (index < imageList.length) {
                      return Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.transparent,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: imageList[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0.0,
                            right: 1.0,
                            child: Container(
                              color: Colors.black.withOpacity(0.5),
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                imageDescriptions[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
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
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    }
                    return Container(); // Eğer index'lerin dışında ise boş bir Container döndür.
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
