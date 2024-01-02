import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_project/Gossip/filewr.dart';
import 'package:flutter_project/Gossip/incontainer.dart';
import 'package:flutter_project/Gossip/listler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
<<<<<<< HEAD
import 'package:flutter_project/Gossip/model/imageDescription.dart';
import 'package:flutter_project/Gossip/model/imageList.dart';
import 'package:flutter_project/Gossip/model/textMessage.dart';
import 'package:transparent_image/transparent_image.dart';
=======
import 'package:image_picker/image_picker.dart';
>>>>>>> 87523c837419c0cba277f8b18ef7abd11e34e8fe

void main() {
  runApp(MaterialApp(home: Gossip()));
}
<<<<<<< HEAD

class Gossip extends StatefulWidget {
=======
class MyHomePage extends StatefulWidget {
>>>>>>> 87523c837419c0cba277f8b18ef7abd11e34e8fe
  @override
  State<Gossip> createState() => _GossipState();
}

<<<<<<< HEAD
class _GossipState extends State<Gossip> {
  var textController = TextEditingController();
  var textController2 = TextEditingController();
  List<String> containerList = [];
  String text = '';
  List<String> imageList = images.imageList;
  List<String> imageDescriptions = description.imageDescriptions;
  List<String> textMessages = textm.textMessages;
=======
class _MyHomePageState extends State<MyHomePage> {
  int cntrtolistindex=0;
  int i=  0;
  bool first=true;

  TextEditingController textController = TextEditingController();//büyük metin için controller 
  TextEditingController titletextController = TextEditingController();//başlık için controller
  
  List<Containerin>containerwl=[];

  void readfromfile(yol){
    Dosyawr.rf(yol).then((value){
      setState((){
        containerwl=value;
        
          i=containerwl.length;
          if (i!=0)
          for(Containerin item in containerwl){
          item.text=item.text.replaceAll("é", ",");
          containerList.add(containermaking(cntrtolistindex));
          cntrtolistindex++;
          i=containerList.length;     
        }
      });
    });
  }
  String pickedimage='';
  File?_selectedImage;

  void writetofile(){
    setState(() {
    var title=titletextController.text;
    var imagefromaddresim=pickedimage;
    var text=textController.text.replaceAll(",", "é");
    var imagefromgalleriypath=_selectedImage?.path;
    if (_selectedImage!=null && imagefromaddresim=='')
      {var newc=Containerin(title: title,imagefromgalleriypath: imagefromgalleriypath,text: text);
      containerwl.add(newc);}
    else if(imagefromgalleriypath==null && imagefromaddresim!=''){
    var newc=Containerin(title: title,imagefromaddresim: imagefromaddresim,text:text);
    containerwl.add(newc);}
    else {var newc=Containerin(title: title, text: text);
    containerwl.add(newc);}
    Dosyawr.dosyayaYaz("C:/Users/EbrarTasdemir/Desktop/Github/Flutter-Projects/lib/Gossip/filekeeping/file.txt", containerwl);//yolu değistirin 
    }
    );
  }
  //başlık için text sonradan tutabilimek için 
  List<ClipRRect> containerList= ContainerListClass.containerList;
    Future _pickImageFromGallery() async{
    final ImagePicker picker = ImagePicker();
// Pick an image.
  final XFile? pickediimage = await picker.pickImage(source: ImageSource.gallery);
  //if (pickediimage==Null)return ;
  setState(() {
    if (pickediimage?.path==null) return Navigator.of(context).pop();
    else _selectedImage=File(pickediimage!.path);
  });
  }
  ClipRRect containermaking (int index) {
    
  if(containerwl[index].imagefromgalleriypath!=null){
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.0),
      child: Container(
        padding: EdgeInsets.all(4),
        color: Colors.black.withOpacity(0.5),
        child: Column(children:[
          Text("${containerwl[index].title.toUpperCase()}",style:TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          )),
    ClipRRect(
      borderRadius: BorderRadius.circular(4.0),
      child: Container(
            padding: EdgeInsets.all(4.0),
            child:Image.file(File("${containerwl[index].imagefromgalleriypath}"))),
    ),
          Text("${containerwl[index].text.replaceAll("é", ",")}",style:TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ))
    
        ],),
          ),
    );
  }
  else if(containerwl[index].imagefromaddresim!=null){
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.0),
      child: Container(
        padding: EdgeInsets.all(4),
        color: Colors.black.withOpacity(0.5),
        child: Column(children:[
          Text("${containerwl[index].title.toUpperCase()}",style:TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          )),
          ClipRRect(
      borderRadius: BorderRadius.circular(4.0),
      child:
          Container(
          padding: EdgeInsets.all(4.0),
          child: Image.network("${containerwl[index].imagefromaddresim}",fit:BoxFit.cover))),
          Text("${containerwl[index].text.replaceAll("é", ",")}",style:TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ))
    
        ],),
          ),
    );
  }
  return ClipRRect(
      borderRadius: BorderRadius.circular(4.0),
      child: Container(
        padding: EdgeInsets.all(4),
        color: Colors.black.withOpacity(0.5),
        child: Column(children:[
          Text("${containerwl[index].title.toUpperCase()}",style:TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          )),
          
          Text("${containerwl[index].text.replaceAll("é", ",")}",style:TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ))
    
        ],),
          ),
    );
  }



    Padding addresim(String resimadres){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:4.0),
      child: TextButton(
        onPressed: (){
          pickedimage=resimadres;
        }
        ,
        style: ElevatedButton.styleFrom(
    
          backgroundColor:  Colors.black.withOpacity(0.2),
        ),
        child: ClipRRect
        (borderRadius: BorderRadius.circular(4),
        
          child: Container(
                                            width: 150.0,
                                            height: 150.0,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(4.0),
                                            child: Image.network(resimadres,fit:BoxFit.cover)),),
        )
      ),
    );
  }
  Row metinalani(TextEditingController textc,String hintText,String titlename){
  return Row(
                            children: [
                              Expanded(
                                child: 
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    style: TextStyle(color: Colors.white.withOpacity(0.9)),
                          

                                    cursorColor: Colors.white,
                                    controller: textc,
                                    decoration: InputDecoration(
                                    
                                      
                                      labelText: titlename,
                                      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),//bu metne tıklağında başlık gibi davranıtor
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                        color:Colors.white.withOpacity(0.5))
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                        color:Colors.white)
                                      ),
                                      hintText: hintText,
                                      hintStyle:TextStyle(color: Colors.white.withOpacity(0.5)),
                                      
                                      
                                      
                                      suffixIcon: IconButton(//gerisi bizim kodla aynı
                                        onPressed: () {
                                          textc.clear();
                                        },
                                        icon: Icon(Icons.clear,color: Colors.white.withOpacity(0.5),),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              
                            ],
                          );

}
  
>>>>>>> 87523c837419c0cba277f8b18ef7abd11e34e8fe

  @override
  Widget build(BuildContext context) {
    //layout başlangıcı
    if(first){
      readfromfile("C:/Users/EbrarTasdemir/Desktop/Github/Flutter-Projects/lib/Gossip/filekeeping/file.txt");//değiş
      first=false;
    }
    return MaterialApp(
      home: SafeArea(
        child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [ Color(0xffee2d88),Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,)
                ),
        child:Scaffold(
          backgroundColor: Colors.transparent,
          body: 
                    Column(          
                            children: [Expanded(
                              child: CustomScrollView( // Wrap your Column with SingleChildScrollView
                    slivers:[ SliverAppBar(
                      backgroundColor: Colors.black,
                      title: Text("W H I S P E R G P T"),
                      expandedHeight: 200,
                      flexibleSpace: FlexibleSpaceBar(background: Container(color: const Color(0xffa82060),)),
                      leading: IconButton(icon:Icon(Icons.arrow_back_ios_new),onPressed:(){Navigator.of(context).pop();}),
                    ),
                    SliverToBoxAdapter(
                      child: MasonryGridView.builder(
                      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      physics:NeverScrollableScrollPhysics(),
                      itemCount:  containerwl.length,
                      shrinkWrap: true,
                      itemBuilder: ((context, i) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: containerList[i],
                      )),
                        ),
                    ),
                    ],
                              ),
                            ),
  
                              ]),
                              floatingActionButton: FloatingActionButton(
                                backgroundColor: Colors.white,
            child: Icon(Icons.add,color: Color(0xffa82060),),
            onPressed: () {
              setState(() {
                showModalBottomSheet(
                  enableDrag: true,
                  isScrollControlled: true,
                  context: context,
                  backgroundColor: Colors.transparent,//containerin rengi olduğundna bunu direct transparan yapıyoz
                  builder: (BuildContext context) =>GestureDetector(
              behavior: HitTestBehavior.opaque,//alan belirlemek için kullanıyor sanırım listview yüzünden arkaya dokununca sheet kapanmıyor bunun için arkayo seçmek gibi bir şey
              onTap: () => Navigator.of(context).pop(),//sheeti kapamak için
               child: DraggableScrollableSheet(
                initialChildSize: 0.7,//ilk açıldığındaki boyutu
                maxChildSize: 0.7,//max alabileceği boyut ilkle aynı olmalıymış 
                minChildSize: 0.3,//bu değerden küçük olunca otomatik kendini aşağı atıp kapanıyor
             
                builder:(_,controller)=> Container(
                          decoration: BoxDecoration(color:Color(0xffa82060),
                          borderRadius: BorderRadius.vertical(//yuvarlak kenar için
                          top:Radius.circular(20.0)),),
                  padding: EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        children: [
                          metinalani(titletextController, "Metni bir kaç cümleyle özetle","Başlık"),//textfield
                          metinalani(textController,"Detaylarıyla anlat bakalım","Metin"),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all( width:4.0,
                                        color: Colors.black.withOpacity(0.7)),
                                      color: Colors.black.withOpacity(0.5),
                                      borderRadius: BorderRadius.all(//yuvarlak kenar için
                                      Radius.circular(20.0)),
                                      ),
                                      child: TextButton(onPressed: (){
                                        _pickImageFromGallery();
                                                            
                                      },child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [Icon(Icons.add_a_photo,size: 50,color: Colors.white.withOpacity(0.9),
                                      ),
                                      _selectedImage==null? Text("Lütfen galerinizden fotoğraf seçiniz",textAlign:TextAlign.center,style: TextStyle(color:Colors.white.withOpacity(0.9) ,),):Text("",style: TextStyle(color: Color.fromARGB(255, 143, 68, 156)),)
                                      ]))
                                    ),
                                  
                                ),
                                Expanded(
                                  
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all( width:4.0,
                                        color: Colors.black.withOpacity(0.7)),
                                      color: Colors.black.withOpacity(0.5),
                                      borderRadius: BorderRadius.all(//yuvarlak kenar için
                                      Radius.circular(20.0)),
                                      ),

                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            IconButton(onPressed: (){pickedimage='';}, icon: Icon(Icons.cancel,color: Colors.white.withOpacity(0.7),)),
                                            Expanded(
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  children: [
                                                    addresim("https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR7CzJI8cMA0yfEkSgsGwMeZxM12Hi5kD6_e88KwsvNbd2I1h3b"),
                                                    addresim("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH8uWqct-rgzKC-UtcVW8YEMq_NPm_BMGAvA&usqp=CAU"),     
                                                    addresim("https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSen8n2uo29WiGoKkAsz9_5CVDDsmFM0bY-fQAwu7LQ_3Xxfna9"),
                                                    addresim("https://snworksceo.imgix.net/dth/84e832cc-b853-40d1-bcf9-bd0d2aae2bec.sized-1000x1000.png?w=800&h=600"),
                                                    addresim("https://media.tenor.com/KXPcvHCgCHEAAAAM/friends-oh-my-eyes-my-eyes.gif"),
                                                    addresim("https://media3.giphy.com/media/JZgZbes8WGGBi/200w.gif?cid=6c09b952o6906p6vpya5byk74fd94rlyi7zkebusncsqxnq7&ep=v1_gifs_search&rid=200w.gif&ct=g"),
                                                    addresim("https://media.tenor.com/CqPOD1xtSX8AAAAM/thor-funny-thor-ragnarok.gif")
                                                                          ]),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  
                                ),
                                
                              ],
                            ),
                          ),
                        ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                   
                                    if(titletextController.text=='' ||textController.text==''){
                                      showDialog(
                                        context: context,
                                        builder: (context)=>AlertDialog(
                                          actions: [
                                            TextButton(onPressed:(){Navigator.of(context).pop();}, child: Text("Tamam"),),
                                          ],
                                          title: Text("Uyarı!"),
                                          contentPadding: EdgeInsets.all(20.0),
                                          content: Text("Metin veya başlık eksik girdin sanınım!")
                                        ));
                                    }
                                    else if(pickedimage!='' &&_selectedImage!=null){
                                      showDialog(
                                        context: context,
                                        builder: (context)=>AlertDialog(
                                          actions: [
                                            TextButton(onPressed:(){
                                              pickedimage='';
                                              Navigator.of(context).pop();}, child: Text("Galeri"),),
                                              TextButton(onPressed:(){
                                              _selectedImage=null;
                                              Navigator.of(context).pop();}, child: Text("Fotoğraf veya gif seçim"),),
                                          ],
                                          title: Text("Uyarı!"),
                                          contentPadding: EdgeInsets.all(20.0),
                                          content: Text("Fotoğraf galeri ve seçim özellliklerini aynı anda kullanamazsın. Hangisini kullanmak istersin?")
                                        ));
                                    }
                                    else{showDialog(
                                        context: context,
                                        builder: (context)=>AlertDialog(
                                          actions: [
                                            TextButton(onPressed:(){
                                              writetofile();
                                    containerList.add(containermaking(i));
                                    ++i;
                                    
                                    titletextController.clear();
                                    textController.clear();
                                    pickedimage='';
                                    _selectedImage=null;

                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();

                                            }, child: Text("Evet"),),
                                            TextButton(onPressed:(){Navigator.of(context).pop();}, child: Text("Hayır"),),

                                          ],
                                          title: Text("Uyarı!"),
                                          contentPadding: EdgeInsets.all(20.0),
                                          content: Text("Hey,eklediğin şey sonsuza kadar kalacak farkındasın değil mi?")
                                        ));

                                    
                                    }  
                                  });
                                  
                                },
                                child: Row(mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.min,
                                  children: [ const Text("Gönder",style: TextStyle(color: Colors.white),),
                                    Icon(Icons.send,color: Colors.white.withOpacity(0.9),),
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black.withOpacity(0.5)
                                ),
                                
                                
                              ),
                              ],
                      ),
                    ),
                  
                ),),
                ));
              });
            },
          ),
                  ),
<<<<<<< HEAD
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
=======
>>>>>>> 87523c837419c0cba277f8b18ef7abd11e34e8fe
          ),
      ),
      
    );
  }

}