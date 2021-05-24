import 'package:flutter/material.dart';

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

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final screenSize = data.size;

    return ListView(
      children: <Widget>[
        Top(height: screenSize.height * .9),
        Middle(
          height: screenSize.height * .9,
        ),
        Bottom(),
      ],
    );
  }
}

class Top extends StatefulWidget {
  final double height;

  Top({required this.height});

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
              '개인 용달 쉽고 간편하게 구해보세요',
              style: TextStyle(color: Colors.white, fontSize: 24.0),
            ),
            Text(
              '용달/원룸 이사 전문',
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
                    onPressed: () {},
                    child: Text('견적 문의',
                        style: TextStyle(color: Colors.white, fontSize: 20.0))),
              ],
            )
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

  Middle({required this.height});

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
                    style: TextStyle(fontSize: 20.0, color: Colors.white)),
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
                    "전문가에게 전화를 하기 전\r\n용달/이사 할 사항을 정리합니다.",
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
                    style: TextStyle(fontSize: 20.0, color: Colors.white)),
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
                      style: TextStyle(fontSize: 20.0, color: Colors.white)),
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
                    "전문가와 일정 및 금액에 대해 협의를 진행 후, 용달/이사를 진행합니다.",
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
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
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
                          onPressed: () {},
                          child: Text(
                            "견적 문의",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ))),
                  /*
                  Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      width: double.infinity,
                      height: 180,
                      child: Card(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("이사 시\r\n  - 이사하는 물품의 사진 필수",
                              style: TextStyle(fontSize: 15.0)),
                          Text("용달 시\r\n  - 용달 할 물품 사진 필수",
                              style: TextStyle(fontSize: 15.0)),
                        ],
                      )))
                      */
                ]);
              },
            )));
  }
}
