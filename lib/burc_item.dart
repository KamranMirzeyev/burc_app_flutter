import 'package:burcapp/burc-detail.dart';
import 'package:burcapp/models/burc.dart';
import 'package:flutter/material.dart';

class BurcItem extends StatelessWidget {
  final Burc currentburc;
  const BurcItem({required this.currentburc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, 'burcDetail',
                  arguments: currentburc);
            },
            leading: Image.asset(
              "images/" + currentburc.photo,
              width: 64,
              height: 64,
            ),
            title: Text(currentburc.adi, style: textStyle.headline5),
            subtitle: Text(currentburc.tarix, style: textStyle.subtitle1),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.pink),
          ),
        ),
      ),
    );
  }
}
