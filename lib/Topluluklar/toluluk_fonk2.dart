// import 'package:topluluklar_deneme/topluluk_fonk.dart';
// import 'package:topluluklar_deneme/topluluk_liste.dart';


// class ListeyeAtma{
//   //List<Fonksiyon> 
  
//   static List<Fonksiyon> toplulukElevateButton (){
//     List<Fonksiyon> liste=[];
//     for(var eleman in ToplulukMap.toplulukIsimListeleri ){
//         liste.add(Fonksiyon(
//         ToplulukMap.dict[eleman]["image"],
//             ToplulukMap.dict[eleman]["kisim"],
//             ToplulukMap.dict[eleman]["uisim"])); }
//     return liste;

    
//   }
  
// }
// /*ToplulukElevateButton(
              
//             ToplulukMap.dict[ToplulukMap.toplulukIsimListeleri[index]]["image"],
//             ToplulukMap.dict[ToplulukMap.toplulukIsimListeleri[index]]["kisim"],
//             ToplulukMap.dict[ToplulukMap.toplulukIsimListeleri[index]]["uisim"]),*/




import 'package:flutter_project/Topluluklar/topluluk_fonk.dart';
import 'topluluk_liste.dart';

class ListeyeAtma{
  //List<Fonksiyon> 
  
  static List<Fonksiyon> toplulukElevateButton (){
    List<Fonksiyon> liste=[];
    for(var eleman in ToplulukMap.dict.entries){
        liste.add(Fonksiyon(
          ToplulukMap.dict[eleman.key]["image"],
          ToplulukMap.dict[eleman.key]["kisim"],
          ToplulukMap.dict[eleman.key]["uisim"],
          eleman.key,
          )); }
    return liste;

    
  }
  
}