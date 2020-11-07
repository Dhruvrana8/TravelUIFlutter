import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}
class _TravelPageState extends State<TravelPage> {
  final DpImageUrl = "assets/images/Dp.jpeg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.purple500,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: VStack([
          VxBox().size(20, 2).white.make(),
          5.heightBox,
          VxBox().size(28, 2).white.make(),
          5.heightBox,
          VxBox().size(15, 2).white.make(),
        ]).pOnly(left: 16,top: 16),
      ),
      body: VStack([
        VxBox(
          child: [
            VxBox()
                .square(100)
                .roundedFull
                .neumorphic(color: Vx.purple500,elevation: 30.0,)
                .bgImage(DecorationImage(image: AssetImage(DpImageUrl)))
                .make(),
            "Hi, ".richText.withTextSpanChildren(["Dhruv".textSpan.bold.make()]).white.xl2.make()
          ].column())
            .makeCentered(),
      ]),
    );
  }
}