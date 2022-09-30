import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/burc_detay.dart';
import 'model/burc.dart';

class BurcItem extends StatelessWidget {
  final Burc listenelenBurc;
  const BurcItem({required this.listenelenBurc, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var MyTextStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/burcDetay",
                  arguments: listenelenBurc);
            },
            leading: Image.asset(
              "images/" + listenelenBurc.burcKucukResim,
            ),
            title: Text(
              listenelenBurc.burcAdi,
              style: MyTextStyle.headline5,
            ),
            subtitle:
                Text(listenelenBurc.burcTarihi, style: MyTextStyle.subtitle1),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.teal,
            ),
          ),
        ),
      ),
    );
  }
}
