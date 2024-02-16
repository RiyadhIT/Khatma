import 'package:flutter/material.dart';
import 'package:khatma/utils/data_WDO.dart';
import 'package:khatma/widgets/ListViewItemClass.dart';

////WDOScreen صفحة طرق التبرع للمؤسسة
///WDO مختصر Ways to donate to the organization
class WDOScreen extends StatefulWidget {
  const WDOScreen({
    super.key,
  });
  static const screenRoute = '/WDOScreen';

  @override
  State<WDOScreen> createState() => _WDOScreenState();
}

class _WDOScreenState extends State<WDOScreen> {
  get child => null;

  listviewItemClass _ListitemClass = new listviewItemClass();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'طرق التبرع للمؤسسة ',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              //////كونتينر الذي يحوي الصورة
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage("assets/images/Aya11.png"),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                height: 180,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 15),
              ),
              SizedBox(
                height: 15,
              ),
              ////الكونتينر الذي يحوي كونتينر اللست فيو
              Column(
                children: [
                  ////تكست ادخال كود المشترك

                  _ListitemClass.buildSectionTitle(
                      context, 'طرق التبرع للمؤسسة '),
                  _ListitemClass.buildListViewContainer(
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: WOD_data.elementAt(0).categories.length,
                      itemBuilder: (ctx, index) => Card(
                        elevation: 0.3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: Text(WOD_data.firstWhere(
                                  (element) => element.id == 'n1')
                              .categories[index]),
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
