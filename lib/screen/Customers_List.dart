import 'package:flutter/material.dart';
import 'package:khatma/constant.dart';

import '../utils/sql_helper.dart';

class CustomerListPage extends StatefulWidget {
  const CustomerListPage({Key? key}) : super(key: key);
  static const screenRoute = '/CustomerListPage';

  @override
  _CustomerListPageState createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
  // All journals
  List<Map<String, dynamic>> _journals = [];

  bool _isLoading = true;
  // This function is used to fetch all data from the database
  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals(); // Loading the diary when the app starts
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _NumberOfReadingsController =
      TextEditingController();

  // This function will be triggered when the floating button is pressed
  // It will also be triggered when you want to update an item
  void _showForm(int? id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingJournal =
          _journals.firstWhere((element) => element['id'] == id);
      _titleController.text = existingJournal['title'];
      _NumberOfReadingsController.text = existingJournal['NumberOfReadings'];
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                // this will prevent the soft keyboard from covering the text fields
                bottom: MediaQuery.of(context).viewInsets.bottom + 120,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(hintText: 'العنوان'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _NumberOfReadingsController,
                    decoration: const InputDecoration(hintText: 'عدد القراءات'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Save new journal
                      if (id == null) {
                        await _addItem();
                        print("save");
                      }

                      if (id != null) {
                        await _updateItem(id);
                        print("updet");
                      }

                      // Clear the text fields
                      _titleController.text = '';
                      _NumberOfReadingsController.text = '';

                      // Close the bottom sheet
                      Navigator.of(context).pop();
                    },
                    child: Text(id == null ? 'أنشاء' : 'حفظ'),
                  )
                ],
              ),
            ));
  }

  static String ConvertDigitsToLatin(String s) {
    var sb = new StringBuffer();
    for (int i = 0; i < s.length; i++) {
      switch (s[i]) {
        //Persian digits
        case '\u06f0':
          sb.write('0');
          break;
        case '\u06f1':
          sb.write('1');
          break;
        case '\u06f2':
          sb.write('2');
          break;
        case '\u06f3':
          sb.write('3');
          break;
        case '\u06f4':
          sb.write('4');
          break;
        case '\u06f5':
          sb.write('5');
          break;
        case '\u06f6':
          sb.write('6');
          break;
        case '\u06f7':
          sb.write('7');
          break;
        case '\u06f8':
          sb.write('8');
          break;
        case '\u06f9':
          sb.write('9');
          break;

        //Arabic digits
        case '\u0660':
          sb.write('0');
          break;
        case '\u0661':
          sb.write('1');
          break;
        case '\u0662':
          sb.write('2');
          break;
        case '\u0663':
          sb.write('3');
          break;
        case '\u0664':
          sb.write('4');
          break;
        case '\u0665':
          sb.write('5');
          break;
        case '\u0666':
          sb.write('6');
          break;
        case '\u0667':
          sb.write('7');
          break;
        case '\u0668':
          sb.write('8');
          break;
        case '\u0669':
          sb.write('9');
          break;
        default:
          sb.write(s[i]);
          break;
      }
    }
    return sb.toString();
  }

// Insert a new journal to the database
  Future<void> _addItem() async {
    String str = ConvertDigitsToLatin(_NumberOfReadingsController.text);
    print('xxxxxxxxxxxxxx $str');
    await SQLHelper.createItem(10000, _titleController.text, str);
    _refreshJournals();
  }

  // Update an existing journal
  Future<void> _updateItem(int id) async {
    String str = ConvertDigitsToLatin(_NumberOfReadingsController.text);
    await SQLHelper.updateItem(id, _titleController.text, str);
    _refreshJournals();
  }

  // Delete an item
  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('تم الحذف بنجاح'),
    ));
    _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('سجل القراءة'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _journals.length,
              itemBuilder: (context, index) => Card(
                color: KBackgroundColor,
                //color: Colors.orange[200],
                margin: const EdgeInsets.all(15),
                child: ListTile(
                    title: Text(
                      _journals[index]['title'],
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    subtitle: Text(_journals[index]['NumberOfReadings'],
                        style: TextStyle(
                          color: Color.fromARGB(255, 52, 18, 175),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        )),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            color: Colors.black,
                            onPressed: () => _showForm(_journals[index]['id']),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            color: Colors.red,
                            onPressed: () =>
                                _deleteItem(_journals[index]['id']),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.add),
      //   onPressed: () => _showForm(null),
      // ),
    );
  }
}
