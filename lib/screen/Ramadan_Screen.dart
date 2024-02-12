import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:khatma/utils/app_data.dart';
import 'package:khatma/utils/data_Ramadan_Instructions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant.dart';
import '../quran_kareem/constant.dart';
import '../utils/Customer_page_number.dart';
import '../widgets/ListViewItemClass.dart';

////صفحة تعليمات شهر رمضان
class RamadanScreen extends StatefulWidget {
  const RamadanScreen({
    super.key,
  });
  static const screenRoute = '/RamadanScreen';

  @override
  State<RamadanScreen> createState() => _RamadanScreenState();
}

class _RamadanScreenState extends State<RamadanScreen> {
  get child => null;

  listviewItemClass _ListitemClass = new listviewItemClass();
  @override
  @override
  Widget build(BuildContext context) {
    TextEditingController _txtCusromerPageNumber = TextEditingController();

    int _currentIndex;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'برنامج شهر رمضان ',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color.fromARGB(255, 197, 197, 197)),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Center(
                  child: Text(
                    "تحت شعار ( اضمن لاخرتك ولامواتك ثواب (300) ختمه قرانية والعديد من المميزات).",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 6, 6),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ElMessiri',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              //////////////////////////////////////////////
              /////////////////////////////////////////////
              ////////////////////////////////////////////
              ///كونتينر شروط الاشتراك
              Column(
                children: [
                  ////تكست ادخال كود المشترك

                  _ListitemClass.buildSectionTitle(context, 'شروط الاشتراك'),
                  _ListitemClass.buildListViewContainer(
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: Ramadan_data.elementAt(0).categories.length,
                      itemBuilder: (ctx, index) => Card(
                        elevation: 0.3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: Text(Ramadan_data.firstWhere(
                                  (element) => element.id == 'n1')
                              .categories[index]),
                        ),
                      ),
                    ),
                  ),
                  _ListitemClass.buildSectionTitle(context, 'ثواب المشترك'),
                  _ListitemClass.buildListViewContainer(
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: Ramadan_data.elementAt(1).categories.length,
                      itemBuilder: (ctx, index) => Card(
                        elevation: 0.3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: Text(Ramadan_data.firstWhere(
                                  (element) => element.id == 'n2')
                              .categories[index]),
                        ),
                      ),
                    ),
                  ),
                  _ListitemClass.buildSectionTitle(context, "نية القرائة"),
                  _ListitemClass.buildListViewContainer(
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: Ramadan_data.elementAt(2).categories.length,
                      itemBuilder: (ctx, index) => Card(
                        elevation: 0.3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: Text(Ramadan_data.firstWhere(
                                  (element) => element.id == 'n3')
                              .categories[index]),
                        ),
                      ),
                    ),
                  ),
                  _ListitemClass.buildSectionTitle(context, "الملاحظات"),
                  _ListitemClass.buildListViewContainer(
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: Ramadan_data.elementAt(3).categories.length,
                      itemBuilder: (ctx, index) => Card(
                        elevation: 0.3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: Text(Ramadan_data.firstWhere(
                                  (element) => element.id == 'n4')
                              .categories[index]),
                        ),
                      ),
                    ),
                  ),
                  _ListitemClass.buildSectionTitle(context,
                      "علماً ان ثواب المشتركين الاحياء والاموات في برنامج رمضان للعام الماضي هو :"),

                  _ListitemClass.buildListViewContainer(
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: Ramadan_data.elementAt(4).categories.length,
                      itemBuilder: (ctx, index) => Card(
                        elevation: 0.3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: Text(Ramadan_data.firstWhere(
                                  (element) => element.id == 'n5')
                              .categories[index]),
                        ),
                      ),
                    ),
                  ),
                  _ListitemClass.buildSectionTitle(
                      context, "طريقة الاشتراك بالبرنامج"),
                  _ListitemClass.buildListViewContainer(
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: Ramadan_data.elementAt(5).categories.length,
                      itemBuilder: (ctx, index) => Card(
                        elevation: 0.3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: ListTile(
                            title: Text(Ramadan_data.firstWhere(
                                    (element) => element.id == 'n6')
                                .categories[index]),
                            leading: const Icon(
                              Icons.app_registration_sharp,
                              color: Colors.blue,
                            ),
                            onTap: () async {
                              _currentIndex =
                                  index; ////لجب انديكس اللست المراد عمل رابط لها
                              if (_currentIndex != 2) return;

                              if (!await launchUrl(GoogleDosOrInstitutionurl,
                                  mode: LaunchMode.externalApplication)) {
                                throw 'Could not launch $GoogleDosOrInstitutionurl';
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
