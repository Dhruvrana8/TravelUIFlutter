import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}
class _TravelPageState extends State<TravelPage> with TickerProviderStateMixin{
  final DpImageUrl = "assets/images/Dp.jpeg";
  TabController _tabController;
  final pic1 =
      "https://images.unsplash.com/photo-1533929736458-ca588d08c8be?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60";

  final pic2 =
      "https://images.unsplash.com/photo-1582050041567-9cfdd330d545?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60";
  double anim =1.0;
  double anim2 =1.0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this,length: 4);
    withAnimation(vsync: this, tween: Tween(begin : 1.0,end :0.0),
        callBack: (animationVal , controllerVal){
      anim = animationVal;
      setState(() {});
        });
    withRepeatAnimation(vsync: this,
        isRepeatReversed: true ,
        tween: Tween(begin : 1.5,end :2.5),
        callBack: (animationVal , controllerVal){
      anim2 = animationVal;
      setState(() {});
        });
  }
  @override
  Widget build(BuildContext context) {
    final tabIndex = _tabController.index;
    return Scaffold(
      backgroundColor: Vx.blue500,
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
                .neumorphic(color: Vx.blue600,elevation: 30.0,)
                .bgImage(DecorationImage(image: AssetImage(DpImageUrl)))
                .make(),
            20.heightBox,
            "Hi, ".richText.withTextSpanChildren(
                ["Dhruv".textSpan.bold.make()])
                .white.xl2.make().p8().offset(offset: Offset(-300 * anim,0.0)),
            "Solo Traveller".text.white.make(),
            VxTextField(
              borderType: VxTextFieldBorderType.none,
              borderRadius: 18,
              fillColor: Vx.gray200.withOpacity(0.3),
              hint: "Search",
              contentPaddingTop: 13,
              autofocus: false,
              prefixIcon: Icon(Icons.search_off_outlined,color: Colors.white,),
            ).customTheme(
                themeData: ThemeData(
                    brightness: Brightness.dark
                )).cornerRadius(10).p16(),
          ].column())
            .makeCentered().h32(context),
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
            topRight: Radius.circular(20)
          ),
          child: VxBox(
            child: VStack([
              TabBar(
                controller: _tabController,
                indicatorColor: Colors.blue,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Vx.blue500,
                unselectedLabelColor: Vx.gray600,
                labelPadding: Vx.m16,

                tabs: [
                  Icon(Icons.map,size: 10,).scale(scaleValue: tabIndex==0?anim2:3.0),
                  Icon(Icons.pin_drop,size: 10,).scale(scaleValue: tabIndex==1?anim2:3.0),
                  Icon(Icons.restaurant,size: 10,).scale(scaleValue: tabIndex==2?anim2:3.0),
                  Icon(Icons.person,size: 10,).scale(scaleValue: tabIndex==3?anim2:3.0),
              ],
              ),
              TabBarView(
                controller: _tabController,
                  children: ["1","2","3","4"].map((e) => VStack([
                    "Discover places in London"
                    .text
                    .gray600
                    .xl2
                    .bold
                    .make(),
                    TravleCard(
                      imageUrl: pic1,
                      title: "Tower Bride",
                      subtitle: "Southwork",
                    ),20.heightBox,
                    TravleCard(
                      imageUrl: pic2,
                      title: "London Eye",
                      subtitle: "Country Hall",
                    ),20.heightBox,
                  ]).p16()
                  ).toList(),
              ).expand()
            ])
          ).white.make(),
        ).expand()
      ]),
    );
  }
}
class TravleCard extends StatelessWidget {
  final String title,subtitle,imageUrl;

  const TravleCard({Key key, this.title, this.subtitle, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HStack([
      Image.network(imageUrl,fit: BoxFit.cover,).wh(context.percentWidth*35,100)
          .cornerRadius(10),
      20.widthBox,
      VStack([
        title.text.semiBold.make(),
        3.heightBox,
        subtitle.text.make().shimmer(),
        5.heightBox,
        [
          VxRating(
            size: 13,
            onRatingUpdate: (value){},
          ),
          5.widthBox,
          "(100)".text.xs.gray600.make()
        ].row()
      ]).expand()
    ],
      crossAlignment: CrossAxisAlignment.start,
    ).cornerRadius(8).backgroundColor(Vx.blue300);
  }
}
