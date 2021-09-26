// Add These two external dependencies
// alphabet_list_scroll_view: ^2.0.0
// flutter_slidable: ^0.6.0

import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() => runApp(MainApp());

final List<String> universityList = [
  'Lucknow University',
  'Amity University',
  'Allahabad University',
  'IIT',
  'NIT',
  'IIM',
  'Engineering Colege',
  'Xmas College',
  'Staford Uni',
  'Oxford University',
  'B Uni',
  'Hefef',
  'Wdgiugfw',
  'YUigwiugif',
  'UGUOE',
  'Yufyi'
];
int universityListLength = universityList.length;

class Universities {
  final String name;

  Universities(this.name);
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Universities> universitiesList = [];
  List<String> strList = [];
  List<Widget> normalList = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    for (int i = 0; i < universityListLength; i++) {
      universitiesList.add(Universities(universityList[i]));
    }
    universitiesList.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    filterList();
    searchController.addListener(() {
      filterList();
    });
    super.initState();
  }

  filterList() {
    List<Universities> universitiess = [];
    universitiess.addAll(universitiesList);
    normalList = [];
    strList = [];
    if (searchController.text.isNotEmpty) {
      universitiess.retainWhere((universities) => universities.name.toLowerCase().contains(searchController.text.toLowerCase()));
    }
    universitiess.forEach((universities) {
      normalList.add(
        Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          secondaryActions: <Widget>[
            IconSlideAction(
              iconWidget: Icon(Icons.more_horiz),
              onTap: () {},
            ),
          ],
          child: ListTile(
            // leading: CircleAvatar(
            //   backgroundImage: NetworkImage("https://placeimg.com/200/200/people"),
            // ),
            title: Text(universities.name),
          ),
        ),
      );
      strList.add(universities.name);
    });

    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Select Your University'),
      ),
      body: AlphabetListScrollView(
        strList: strList,
        highlightTextStyle: TextStyle(
          color: Colors.blue,
        ),
        showPreview: true,
        itemBuilder: (context, index) {
          return normalList[index];
        },
        indexedHeight: (i) {
          return 40; // Height Gap Betwwen universities name
        },
        keyboardUsage: true,
        headerWidgetList: <AlphabetScrollListHeader>[
          AlphabetScrollListHeader(widgetList: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffix: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  labelText: "Search University",
                ),
              ),
            )
          ], icon: Icon(Icons.search), indexedHeaderHeight: (index) => 80), //SearchBar Height
        ],
      ),
    ));
  }
}
