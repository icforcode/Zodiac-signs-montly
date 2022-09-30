import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/burc_item.dart';
import 'package:flutter_burc_rehberi/data/strings.dart';
import 'package:flutter_burc_rehberi/model/burc.dart';

class BurcListesi extends StatelessWidget {
  late List<Burc> tumBurclar;
  BurcListesi() {
    tumBurclar = veriKaynaginiHazirla();
    print(tumBurclar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Burclar Listesi",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: ListView.builder(
            itemBuilder: (context, index) {
              return BurcItem(
                listenelenBurc: tumBurclar[index],
              );
            },
            itemCount: tumBurclar.length),
      ),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici = [];
    for (int i = 0; i < 12; i++) {
      var burcAdi = Strings.BURC_ADLARI[i];
      var burcTarih = Strings.BURC_TARIHLERI[i];
      var burcDetay = Strings.BURC_GENEL_OZELLIKLERI[i];
      var burcKucukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png";
      var burcBuyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk" + "${i + 1}.png";
      Burc eklenecekBurc =
          Burc(burcAdi, burcTarih, burcDetay, burcKucukResim, burcBuyukResim);
      gecici.add(eklenecekBurc);
    }
    return gecici;
  }
}
