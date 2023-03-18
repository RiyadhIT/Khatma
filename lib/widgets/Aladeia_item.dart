import 'package:flutter/material.dart';
import '../screen/ReadingAldaeia_Screen.dart';

class AladeiaItem extends StatelessWidget {
  const AladeiaItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
  });

  final String id;
  final String title;
  final String imageUrl;
  final int duration;

  // final Function removeItem;

  void selectDaeia(BuildContext context) {
    Navigator.of(context).pushNamed(
      ReadingAldaeia.screenRoute,
      arguments: {"id": id},
    ).then((result) {
      if (result != null) {
        // removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => selectDaeia(context),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 2,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 70,
                          alignment: Alignment.bottomRight,
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          child: Text(
                            title,
                            style: Theme.of(context).textTheme.headline5,

                            /// overflow: TextOverflow.fade,
                          ),
                        ),
                        Row(
                          children: [
                            // Image.network(
                            //   imageUrl,
                            //   height: 50,
                            //   //width: double.maxFinite,
                            //   fit: BoxFit.fitHeight,
                            // ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
