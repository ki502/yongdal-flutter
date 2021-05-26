// @dart=2.9
/*좆같은 null safety 때문에 2.12이상 썻을 경우 swiper가 작동하지 않아서 강제로 마이그레이션 각 클래스 생성자 별 required 도 뺌 swiper 고쳐지면 다시 추가해야함*/

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '개인 용달',
        home: Scaffold(
          body: Center(
            child: Body(),
          ),
        ));
  }
}

class Body extends StatefulWidget {
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final screenSize = data.size;
    final dataKey = GlobalKey();

    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        Top(height: screenSize.height * .6, dataKey: dataKey),
        Middle(
          height: screenSize.height * .9,
        ),
        Bottom(
          key: dataKey,
        ),
        PictureList()
      ],
    ));
  }
}

class Top extends StatefulWidget {
  final double height;
  final GlobalKey dataKey;

  Top({this.height, this.dataKey});

  _TopState createState() => _TopState();
}

class _TopState extends State<Top> {
  @override
  Widget build(BuildContext context) {
    var height = widget.height;

    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/truck.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        height: height,
      ),
      Container(
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.black54, Colors.black87])),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              '개인 용달 쉽고 간편하게 구해보세요!',
              style: TextStyle(color: Colors.white, fontSize: 24.0),
            ),
            Text(
              '용달/이사 전문',
              style: TextStyle(color: Colors.white, fontSize: 36.0),
            ),
            Padding(padding: const EdgeInsets.only(top: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.black87,
                      primary: Colors.blue[900],
                      minimumSize: Size(200, 70),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    onPressed: () {
                      Scrollable.ensureVisible(
                          widget.dataKey.currentContext as BuildContext);
                    },
                    child: Text('견적 문의',
                        style: TextStyle(color: Colors.white, fontSize: 20.0))),
              ],
            ),
          ])),
      Container(
          height: height,
          alignment: Alignment.topLeft,
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              margin: EdgeInsets.only(top: 20, left: 50, right: 10),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/icon2.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              'yongdal.com',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            )
          ])),
    ]);
  }
}

class Middle extends StatefulWidget {
  final double height;

  Middle({this.height});

  _MiddleState createState() => _MiddleState();
}

class _MiddleState extends State<Middle> {
  @override
  Widget build(BuildContext context) {
    var height = 350.0;

    return Column(children: [
      Container(
          height: height,
          alignment: Alignment.center,
          color: Colors.blue[900],
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 50.0,
                ),
                Text("요청 사항 정리",
                    style: TextStyle(fontSize: 15.0, color: Colors.white)),
                Container(
                  margin: EdgeInsets.all(20),
                  width: 100,
                  height: 2,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Text(
                    "요청 할 사항을 정리합니다.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                ),
              ],
            )),
            Container(
                child: Icon(
              Icons.arrow_forward_ios_sharp,
              color: Colors.white,
              size: 50,
            )),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_call,
                  color: Colors.white,
                  size: 50.0,
                ),
                Text("견적 문의",
                    style: TextStyle(fontSize: 15.0, color: Colors.white)),
                Container(
                  margin: EdgeInsets.all(20),
                  height: 2,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  alignment: Alignment.center,
                  child: Text(
                    "전문가에게 견적 문의를 합니다.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                ),
              ],
            )),
            Container(
                child: Icon(
              Icons.arrow_forward_ios_sharp,
              color: Colors.white,
              size: 50,
            )),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/icon3.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  child: Text("요청 진행",
                      style: TextStyle(fontSize: 15.0, color: Colors.white)),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  width: 100,
                  height: 2,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  alignment: Alignment.center,
                  child: Text(
                    "전문가와 협의 된 일정에 진행합니다.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                ),
              ],
            ))
          ]))
    ]);
  }
}

class Bottom extends StatefulWidget {
  Bottom({key}) : super(key: key);

  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  var phoneNumberList = ["010-5232-8171", "010-9893-3193"];
  @override
  Widget build(BuildContext context) {
    var isSmallSize = MediaQuery.of(context).size.width <= 800;
    var indexCount = 2;
    var profileHeight = 350.0;
    var crossAxisCount = isSmallSize
        ? 1
        : 2; //(MediaQuery.of(context).size.width / 400).truncate();

    return Container(
        height: (profileHeight * indexCount / crossAxisCount).roundToDouble(),
        color: Colors.blue[900],
        child: Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisExtent: profileHeight),
              itemCount: indexCount,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, index) {
                return Column(children: [
                  Container(
                      margin: EdgeInsets.only(top: 40),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/icon.png'),
                          fit: BoxFit.fill,
                        ),
                        border: Border.all(width: 3, color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      height: 200,
                      width: 200),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: TextButton(
                          style: ElevatedButton.styleFrom(
                            onPrimary: Colors.black87,
                            primary: Colors.blue[900],
                            minimumSize: Size(130, 30),
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          onPressed: () => {
                                if (kIsWeb)
                                  {
                                    showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                              title: const Text("알람"),
                                              content: RichText(
                                                  text: TextSpan(
                                                      text:
                                                          "Mobile에서만 전화로 바로 연결되며,\r\n견적 문의는 ",
                                                      children: <TextSpan>[
                                                    TextSpan(
                                                        text:
                                                            "${phoneNumberList[index]}",
                                                        style: TextStyle(
                                                            color: Colors.red)),
                                                    TextSpan(text: "로 연락주세요.")
                                                  ])),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, '확인'),
                                                  child: const Text('확인'),
                                                ),
                                              ],
                                            ))
                                  }
                                else
                                  {launch("tel://${phoneNumberList[index]}")}
                              },
                          child: Text(
                            "전화 연결",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ))),
                ]);
              },
            )));
  }
}

class PictureList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var datas = [
      {
        "image":
            "https://post-phinf.pstatic.net/MjAyMTA0MjhfNiAg/MDAxNjE5NTc3MDM3ODM1.c78TYUTGdkG3K8pfpcLGVoEOcM5W3TiCVZA_MnmkBLsg.3AgolMnqwSK5azOh40g0IgYTk8YSvFGX3JWNO6c_mX4g.JPEG/1.jpg?type=w1200",
      },
      {
        "image":
            "data:image/jpeg;base64,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",
      },
      {
        "image":
            "https://post-phinf.pstatic.net/MjAyMTA0MjhfNiAg/MDAxNjE5NTc3MDM3ODM1.c78TYUTGdkG3K8pfpcLGVoEOcM5W3TiCVZA_MnmkBLsg.3AgolMnqwSK5azOh40g0IgYTk8YSvFGX3JWNO6c_mX4g.JPEG/1.jpg?type=w1200",
      },
      {
        "image":
            "https://post-phinf.pstatic.net/MjAyMTA0MjhfNiAg/MDAxNjE5NTc3MDM3ODM1.c78TYUTGdkG3K8pfpcLGVoEOcM5W3TiCVZA_MnmkBLsg.3AgolMnqwSK5azOh40g0IgYTk8YSvFGX3JWNO6c_mX4g.JPEG/1.jpg?type=w1200",
      },
      {
        "image":
            "data:image/jpeg;base64,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",
      },
    ];

    var list = <Widget>[];

    for (Map data in datas) {
      list.add(
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Image.network(data['image'], height: 400, fit: BoxFit.fill)
        ]),
      );
    }

    return Container(
        height: 480,
        color: Colors.blue[900],
        child: Container(
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(),
            child: Column(children: [
              Container(
                  margin: EdgeInsets.only(bottom: 20),
                  alignment: Alignment.center,
                  child: Text("고객 사례",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold))),
              Container(
                  height: 400,
                  child: Swiper(
                      itemWidth: 400,
                      layout: SwiperLayout.CUSTOM,
                      customLayoutOption:
                          new CustomLayoutOption(startIndex: -1, stateCount: 3)
                              .addRotate(
                                  [-45.0 / 180, 0.0, 45.0 / 180]).addTranslate([
                        new Offset(-370.0, -40.0),
                        new Offset(0.0, 0.0),
                        new Offset(370.0, -40.0)
                      ]),
                      autoplay: list.length > 3,
                      itemCount: datas.length,
                      itemBuilder: (BuildContext context, index) {
                        return list[index];
                      },
                      duration: 300,
                      control: SwiperControl(color: Colors.black45),
                      pagination: SwiperPagination()))
            ])));
  }
}
