import 'package:flutter/material.dart';

import '../quran_kareem/mydrawer.dart';
import '../utils/data_HomeScreen.dart';
import '../widgets/Home_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const screenRoute = '/categroy-App';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  // void initState() {
  //   super.initState();
  //   Timer(Duration(seconds: 3), navigateToscondPage);
  // }

  // void navigateToscondPage() {
  //   Navigator.push(context as BuildContext,
  //       MaterialPageRoute(builder: (context) => Slpash_Screen()));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: Text("القائمة الرئسية"),
        ),
        backgroundColor: Colors.teal[400],
        body: Container(
          padding: const EdgeInsets.only(
            top: 40,
            left: 20,
            right: 20,
            bottom: 40,
          ),
          child: Container(
              padding: const EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: 10,
              ),
              // color: Colors.white10,
              decoration: BoxDecoration(
                color: Color.fromRGBO(252, 251, 251, 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                children: <Widget>[
                  ////كونتينر الصورة اسم التطبيق
                  Container(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 30,
                      right: 30,
                      bottom: 10,
                    ),

                    // color: Colors.white10,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 247, 245, 245),
                      image: DecorationImage(
                        image: AssetImage("assets/images/33.png"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                    ),
                    child: Text(
                      "لا تهجروا القرآن والصدقة",
                      style: TextStyle(
                          color: Color.fromARGB(255, 221, 59, 59),
                          //decorationColor: Colors.red,
                          decorationStyle: TextDecorationStyle.wavy,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          overflow: TextOverflow.clip,
                          fontFamily: "ElMessiri"),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    //////هذا الكونتينر الذي يحوي القوائم وليس  الكونتينر الابيض فوق الابيض
                    child: Container(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 10,
                          right: 10,
                          bottom: 10,
                        ),
                        // height: double.maxFinite,
                        width: double.maxFinite,
                        //color: Color.fromRGBO(202, 38, 38, 0.102),
                        decoration: BoxDecoration(
                          // color: Color.fromRGBO(250, 250, 250, 1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(),
                            child: GridView(
                              shrinkWrap: true,
                              primary: false,
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      childAspectRatio: 1.75,
                                      mainAxisSpacing: 5,
                                      crossAxisSpacing: 10),
                              children: HomeScreenItemList.map(
                                (homeitem) => HomeItem(homeitem.id,
                                    homeitem.title, homeitem.imageUrl),
                              ).toList(),
                            ),
                          ),
                        )),
                  ),
                ],
              )),
        ));
  }
}
