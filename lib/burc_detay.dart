import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'model/burc.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({required this.secilenBurc, Key? key}) : super(key: key);

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appbarRengi = Colors.transparent;
  late PaletteGenerator _generator;
  @override
  void initState() {
    super.initState();
    appbarRengiBul();

    WidgetsBinding.instance.addPostFrameCallback((_) => appbarRengiBul());

    /// scaffold buildini once appbar buidlini sonra calıstırmak ıcın oncelık sırası ile sıstemı hızlandıran yapı

    //_generator=PaletteGenerator.fromImageProvide(AssetImage(assetName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: IconThemeData(color: Colors.white),
            expandedHeight: 250,
            pinned: true,
            backgroundColor: appbarRengi,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.secilenBurc.burcAdi + "Burcu ve Özellikleri",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              background: Image.asset(
                "images/" + widget.secilenBurc.burcBuyukResim,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Text(
                  widget.secilenBurc.burcDetay,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void appbarRengiBul() async {
    // _generator= await PaletteGenerator.fromImage(Image.asset("images/"+widget.secilenBurc.burcBuyukResim));
    _generator = await PaletteGenerator.fromImageProvider(
      AssetImage("images/${widget.secilenBurc.burcBuyukResim}"),
    );
    appbarRengi = _generator.dominantColor!.color;
    setState(() {});
    print(appbarRengi);
  }
}
