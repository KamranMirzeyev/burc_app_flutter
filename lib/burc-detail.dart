import 'package:burcapp/models/burc.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetail extends StatefulWidget {
  final Burc burc;
  const BurcDetail({required this.burc, Key? key}) : super(key: key);

  @override
  _BurcDetailState createState() => _BurcDetailState();
}

class _BurcDetailState extends State<BurcDetail> {
  Color appbarcolor = Colors.transparent;
  late PaletteGenerator _generator;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => AppColorFind());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: appbarcolor,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.burc.adi),
              centerTitle: true,
              background: Image.asset(
                "images/" + widget.burc.bigPhoto,
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
                    widget.burc.detail,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                )),
          )
        ],
      ),
    );
  }

  void AppColorFind() async {
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage("images/" + widget.burc.bigPhoto));
    appbarcolor = _generator.vibrantColor!.color;
    setState(() {});
  }
}
