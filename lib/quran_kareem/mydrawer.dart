import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import './settings.dart';

import 'constant.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/quran.png',
                  height: 80,
                ),
                const Text(
                  "لا تهجروا القرآن والصدقة",
                  style: TextStyle(fontSize: 16, fontFamily: "ElMessiri"),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
            ),
            title: const Text(
              'الظبط',
              style: TextStyle(fontSize: 16, fontFamily: "ElMessiri"),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Settings()));
            },
          ),
          //خاصة بمشاركة التطبيق تم ايقافها مؤقتا
//           ListTile(
//             leading: const Icon(
//               Icons.share,
//             ),
//             title: const Text(
//               'مشاركة التطبيق',
//               style: TextStyle(fontSize: 16, fontFamily: "ElMessiri"),
//             ),
//             onTap: () async {
// //               Share.share('''*Quran app*\n
// // u can develop it from my github github.com/itsherifahmed ''');
//               // Navigator.pop(context);
//               if (!await launchUrl(sherUrl,
//                   mode: LaunchMode.externalApplication)) {
//                 throw 'Could not launch $quranAppurl';
//               }
//             },
//           ),
          ListTile(
            leading: const Icon(
              Icons.facebook_sharp,
            ),
            title: const Text(
              'فيسبوك',
            ),
            onTap: () async {
              if (!await launchUrl(quranAppurl,
                  mode: LaunchMode.externalApplication)) {
                throw 'Could not launch $quranAppurl';
              }
            },
          ),
        ],
      ),
    );
  }
}
