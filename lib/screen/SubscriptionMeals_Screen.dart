import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khatma/utils/app_data.dart';

import '../constant.dart';
import '../quran_kareem/constant.dart';
import '../utils/Customer_page_number.dart';
import '../widgets/ListViewItemClass.dart';

////صفحة تعليمات الاشتراك
class SubscriptionMeals extends StatefulWidget {
  const SubscriptionMeals({super.key});
  static const screenRoute = '/SubscriptionMeals';

  @override
  State<SubscriptionMeals> createState() => _SubscriptionMealsState();
}

class _SubscriptionMealsState extends State<SubscriptionMeals> {
  get child => null;

  String _page1 = "";
  String _page2 = "";
////////////
  ///دالة لتضبيط العناوين
  Widget buildSectionTitle(BuildContext context, String titleText) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      alignment: Alignment.topRight,
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

//////
/////دالة listvie
  Widget buildListViewContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: child,
    );
  }

//////دالة ادخال كود المشترك
  ///Subscription number ترجمة رقم الاشتراك
  //getSubscription_number رقم الاشتراك المحفوظ
  String _getSubscription_number = "";
  void _getCustomerPageNumber() async {
    setState(() {
      ///PagesOfTheQran[Customer_page_number]['page1']
      int sub_number = Customer_Subscription_number;

      /// int.parse(Subscription_number);
      //  int d = CodOfCustomer.indexOf(txt);////مثال في حال عمل لست خاصة بالاكودا لكل مشترك

      if ((Customer_Subscription_number >= -1) &
          (Customer_Subscription_number <= 303)) {
        _page1 = PagesOfTheQran[sub_number]['page1'];
        _page2 = PagesOfTheQran[sub_number]['page2'];
        _getSubscription_number = Customer_Subscription_number.toString();

        ///حفظ رقم الاشتراك
      }
      ;
    });
  }

  void _saveCustomer_Subscription_number(String Subscription_number) async {
    setState(() {
      int sub_number = int.parse(Subscription_number);

      if ((sub_number >= -1) & (sub_number <= 303)) {
        Customer_Subscription_number = sub_number;

        ///حفظ رقم الاشتراك
      }
      ;
    });
  }

  listviewItemClass _ListitemClass = new listviewItemClass();
  @override
  @override
  Widget build(BuildContext context) {
    TextEditingController _txtCusromerPageNumber = TextEditingController();

    _getCustomerPageNumber();
    return Scaffold(
      appBar: AppBar(
        title: Text('تعليمات الاشتراك'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              //color: Colors.green,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 241, 241, 241),
                border: Border.all(color: Color.fromARGB(255, 200, 202, 202)),
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,

              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 15),

              ///ليخذ كامل الصفحة,
              child: Column(
                children: [
                  ////تكست ادخال كود المشترك

                  Container(
                    // color: Color.fromRGBO(60, 158, 60, 1),
                    child: Row(
                      children: [
                        Flexible(
                          flex:
                              2, //هذه الخاصية تحدد نسبة الفراغ المتاح الذي يستخدمه العنصر
                          //fit: FlexFit .tight,
                          //لجعل Flexible يمتلك كل المساحة المتاحة،
                          child: TextField(
                            enableSuggestions: false,
                            autocorrect: false,
                            controller: _txtCusromerPageNumber,
                            decoration: const InputDecoration(
                                hintText: 'ادخل رقم الاشتراك الخاص بك'),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                        SizedBox(width: 15),
                        Flexible(
                          flex:
                              1, //هذه الخاصية تحدد نسبة الفراغ المتاح الذي يستخدمه العنصر
                          //fit: FlexFit.loose,//للسماح لـ Flexible بتغيير حجمه وشكله.
                          // fit: FlexFit .tight,
                          //لجعل Flexible يمتلك كل المساحة المتاحة،
                          child: ElevatedButton.icon(
                            onPressed: () {
                              _saveCustomer_Subscription_number(
                                  _txtCusromerPageNumber.text.toString());

                              ///دالة جلب صفحة المشترك
                              _getCustomerPageNumber();
                              //دالة حفظ رقم المشترك في شيرد برفرنس
                              saveCustomer_page_number();
                            },
                            icon: Icon(Icons.save),
                            label: Text('حفظ'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  Text("رقم الاشتراك :$_getSubscription_number",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: kBluecolor,
                        fontFamily: 'ElMessiri',
                        decorationStyle: TextDecorationStyle.wavy,
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                      _page2 == "0" || _page2 == "302"
                          ? "تقرأ الصفحة ( ${_page1} )"
                          : "تقرأ الصفحة ( ${_page1} )  والصفحة ( ${_page2} )",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: kTextColor,
                        fontFamily: 'ElMessiri',
                        decorationStyle: TextDecorationStyle.wavy,
                      )),
                ],
              ),
            ),
            _ListitemClass.buildSectionTitle(context, 'واجبات المشترك'),
            _ListitemClass.buildListViewContainer(
              ListView.builder(
                shrinkWrap: true,
                itemCount: SubscriptonMeals_data.elementAt(0).categories.length,
                itemBuilder: (ctx, index) => Card(
                  elevation: 0.3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(SubscriptonMeals_data.firstWhere(
                        (element) => element.id == 'n1').categories[index]),
                  ),
                ),
              ),
            ),
            _ListitemClass.buildSectionTitle(
                context, 'الثواب الذي يحصل علية المشترك'),
            _ListitemClass.buildListViewContainer(
              ListView.builder(
                shrinkWrap: true,
                itemCount: SubscriptonMeals_data.elementAt(1).categories.length,
                itemBuilder: (ctx, index) => Card(
                  elevation: 0.3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(SubscriptonMeals_data.firstWhere(
                        (element) => element.id == 'n2').categories[index]),
                  ),
                ),
              ),
            ),
            _ListitemClass.buildSectionTitle(context, "الاشتراك بدفع مبلغ"),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                alignment: Alignment.topRight,
                child: Text(
                  '  من خلال دفع 4000 دينار شهرياً يمكنك الاشتراك ايظاً وألحصول على ألميزات ألتالية خلال ستة أشهر من دون قرائة ألواجبات أعلاه',
                  style: TextStyle(
                    color: Color(0xFFAD3D3D),
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                  ),
                )),
            _ListitemClass.buildListViewContainer(
              ListView.builder(
                shrinkWrap: true,
                itemCount: SubscriptonMeals_data.elementAt(2).categories.length,
                itemBuilder: (ctx, index) => Card(
                  elevation: 0.3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(SubscriptonMeals_data.firstWhere(
                        (element) => element.id == 'n3').categories[index]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
