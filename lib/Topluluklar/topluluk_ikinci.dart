// // import 'package:flutter/material.dart';
// // import 'package:topluluklar_deneme/topluluk.dart';

// // class Topluluk2 extends StatelessWidget {
// //   const Topluluk2({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         body: CustomScrollView(
// //           slivers: [
// //             SliverAppBar(
// //               shape: ContinuousRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0))),
// //               leading: IconButton(
// //               icon: Icon(Icons.arrow_back_ios),
// //               onPressed: (){
// //               Navigator.of(context).push(MaterialPageRoute(builder: (context) => ToplulukMerkezi()));
// //             }),
// //             expandedHeight: 200,
// //             flexibleSpace: FlexibleSpaceBar(background: Image.asset("images/thunder.jpg",fit: BoxFit.cover,)),
// //             ),
// //             SliverToBoxAdapter(
// //               child: Padding(
// //                 padding: EdgeInsets.all(8.0),
// //                 child: Container(
// //                   height: 1000,
// //                 ),
// //               ),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:topluluklar_deneme/toluluk_fonk2.dart';
// import 'package:topluluklar_deneme/topluluk.dart';
// import 'package:topluluklar_deneme/topluluk_liste.dart';

// class Topluluk2 extends StatefulWidget {
//   String kisim;
//   Topluluk2(this.kisim);

//   @override
//   State<Topluluk2> createState() => _Topluluk2State();
// }

// class _Topluluk2State extends State<Topluluk2> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Color.fromARGB(255, 235, 244, 255),
//         body: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               backgroundColor: Color.fromARGB(255, 235, 244, 255),

//               leading: IconButton(
//                 icon: Icon(Icons.arrow_back_ios),
//                 onPressed: () {
//                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => ToplulukMerkezi()));
//                 },
//               ),
//               expandedHeight: 200,
//               flexibleSpace: FlexibleSpaceBar(
//                 background: ClipRRect(
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(50.0),
//                     bottomRight: Radius.circular(50.0),
//                   ),
//                   child: Image.asset(
//                     "images/thunder.jpg",
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Container(
//                   child: ListView.builder(
//                     itemCount: ToplulukMap.dict.length,
//                     itemBuilder: (context, index) => Column(
//                       children: [
//                         Container(
//                           child: Text('${ToplulukMap.dict[index].toplulukName}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),textAlign: TextAlign.center,),
//                           height: 50,
//                           width: 1000,
//                                 decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                               colors: [
//                                  Color.fromRGBO(108, 115, 251, 0.9),
//                                 Color.fromRGBO(147, 195, 249, 0.9),
                               
//                                 ],
//                                 begin: Alignment.center,
//                                 end: Alignment.bottomCenter,
//                           ),),
//                         ),
//                         SizedBox(height: 8,),
//                         Container(
//                           child: Text('baslık parası 2',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),textAlign: TextAlign.center,),
//                           height: 50,
//                           width: 1000,
//                                 decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                               colors: [
//                                 Color.fromRGBO(147, 195, 249, 0.9),
//                                 Color.fromRGBO(147, 195, 249, 0.9),
                               
//                                 ],
//                                 begin: Alignment.center,
//                                 end: Alignment.bottomCenter,
//                           ),),
//                         ),
//                         SizedBox(height: 8,),  
//                         Container(
//                           child: Text('baslık parası',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15)),
//                           height: 500,
//                           width: 1000,
//                                 decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                               colors: [
//                                 Color.fromRGBO(147, 195, 249, 0.9),
//                                 Color.fromRGBO(108, 115, 251, 0.9),
//                                 ],
//                                 begin: Alignment.center,
//                                 end: Alignment.bottomCenter,
//                           ),),
//                         )                  
                        
//                       ],
//                     ),
//                   ),
//                   height: 650,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// // topluluk_ikinci.dart
import 'package:flutter/material.dart';
import 'package:flutter_project/Topluluklar/topluluk_liste.dart';



class Topluluk2 extends StatefulWidget {
    

  String keytopluluk;
  Topluluk2(this.keytopluluk);
  @override
  State<Topluluk2> createState() => _Topluluk2State();
}

class _Topluluk2State extends State<Topluluk2> {
  
  @override
  Widget build(BuildContext context,) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 235, 244, 255),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Color.fromARGB(255, 235, 244, 255),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100.0),
                    bottomRight: Radius.circular(100.0),
                  ),
                  child: Image.asset(
                    "${ToplulukMap.dict[widget.keytopluluk]["image"]}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              // child: Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: Container(
              //     child: ListView.builder(
              //       itemCount: ToplulukMap.dict.length,
              //       itemBuilder: (context, index) => 
              child:Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                        children: [
                          Container(
                            child: Text(
                              '${(ToplulukMap.dict[widget.keytopluluk]['kisim'])}'.toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            height: 50,
                            width: 1000,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(108, 115, 251, 0.9),
                                  Color.fromRGBO(147, 195, 249, 0.9),
                                ],
                                begin: Alignment.center,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                          SizedBox(height: 8,),
                          Container(
                            child: Text(
                              '${(ToplulukMap.dict[widget.keytopluluk]['uisim'])}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            height: 50,
                            width: 1000,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(147, 195, 249, 0.9),
                                  Color.fromRGBO(147, 195, 249, 0.9),
                                ],
                                begin: Alignment.center,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                          SizedBox(height: 8,),
                          Container(
                            child: Text(
                              'baslık parası',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            height: 500,
                            width: 1000,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(147, 195, 249, 0.9),
                                  Color.fromRGBO(108, 115, 251, 0.9),
                                ],
                                begin: Alignment.center,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ],
                               
              
                      ),
              ),
                  ),
                ]),
              ),
            );
  }
}