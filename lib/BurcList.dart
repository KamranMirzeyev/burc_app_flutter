import 'package:burcapp/burc_item.dart';
import 'package:burcapp/data/strings.dart';
import 'package:burcapp/models/burc.dart';
import 'package:flutter/material.dart';

class BurcLists extends StatelessWidget {
  late List<Burc> burcs;

  BurcLists() {
    burcs = BurcListi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Burcler"),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return BurcItem(currentburc: burcs[index]);
          },
          itemCount: burcs.length,
        ),
      ),
    );
  }

  List<Burc> BurcListi() {
    List<Burc> data = [];
    for (var i = 0; i < 12; i++) {
      var burcadi = Strings.BURC_ADLARI[i];
      var burctarixi = Strings.BURC_TARIHLERI[i];
      var detail = Strings.BURC_GENEL_OZELLIKLERI[i];
      var photo = burcadi.toLowerCase() + '${i + 1}.png';
      var bigphoto = burcadi.toLowerCase() + '_buyuk' + '${i + 1}.png';
      Burc b = Burc(burcadi, burctarixi, detail, photo, bigphoto);
      data.add(b);
    }
    return data;
  }
}
