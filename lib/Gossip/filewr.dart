import 'dart:io';

import 'package:flutter_project/Gossip/incontainer.dart';



class Dosyawr{
static Future<List<Containerin>> rf(String yol) async {
    List<Containerin> containerworking = [];
    var lines = await File(yol).readAsLines();
    for (String line in lines) {
      if (line.startsWith('a')){
        line=line.substring(1);
        var parts=line.split(',');
        Containerin newc=Containerin(title: parts[0], imagefromgalleriypath:parts[1] , text: parts[2]);
        containerworking.add(newc);
      }
      else if (line.startsWith('b')){
        line=line.substring(1);
        var parts=line.split(',');
        Containerin newc=Containerin(title: parts[0], imagefromaddresim:parts[1] , text: parts[2]);
        containerworking.add(newc);
      }
      else if (line.startsWith('c')){
        line=line.substring(1);
        var parts=line.split(',');
        Containerin newc=Containerin(title: parts[0], text:parts[1]);
        containerworking.add(newc);
      }
      
      
    }
    await Future.delayed(Duration(seconds:0 ));
    return containerworking;
  }
  static void dosyayaYaz(String yol, List<Containerin> containerworking) async {
    var sonucStringi = "";
    for (Containerin ncw in containerworking) {
      if (ncw.imagefromgalleriypath!=null) sonucStringi += "a${ncw.title},${ncw.imagefromgalleriypath},${ncw.text}\n";
      else if (ncw.imagefromaddresim!=null) sonucStringi += "b${ncw.title},${ncw.imagefromaddresim},${ncw.text}\n";
      else sonucStringi+="c${ncw.title},${ncw.text}\n";
    }
    await File(yol).writeAsString(sonucStringi);
  }
}

