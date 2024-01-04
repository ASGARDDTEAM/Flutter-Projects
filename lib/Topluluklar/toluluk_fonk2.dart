
import 'package:flutter_project/Topluluklar/topluluk_fonk.dart';
import 'topluluk_liste.dart';

class ListeyeAtma{
  static List<Fonksiyon> toplulukElevateButton (){
    List<Fonksiyon> liste=[];
    for(var eleman in ToplulukMap.dict.entries){
        liste.add(Fonksiyon(
          ToplulukMap.dict[eleman.key]["image"],
          ToplulukMap.dict[eleman.key]["kisim"],
          ToplulukMap.dict[eleman.key]["uisim"],
          ToplulukMap.dict[eleman.key]["aciklama"],
          eleman.key,
          )); }
    return liste;
  }
}