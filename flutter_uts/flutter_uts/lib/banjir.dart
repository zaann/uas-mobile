import 'package:flutter/material.dart';
import 'package:flutter_uts/banjir/pascabanjir.dart';
import 'package:flutter_uts/banjir/saatbanjir.dart';
import 'package:flutter_uts/banjir/sebelumbanjir.dart';

class BanjirPage extends StatefulWidget {
  const BanjirPage({Key? key}) : super(key: key);

  @override
  _BanjirPageState createState() => _BanjirPageState();
}

class _BanjirPageState extends State<BanjirPage> {
  int _selectedIndex = 0;

  static const List<String> _categories = [
    '       Sebelum Banjir      ',
    '     Saat Banjir     ',
    '      Pasca Banjir     ',
  ];

  List<Widget> _pages = [
    SebelumBanjirPage(),
    SaatBanjirPage(),
    PascaBanjirPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Mitigasi Banjir',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16.0),
        child: Column(
          children: [
            SizedBox(
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _categories.map((category) {
                  int index = _categories.indexOf(category);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: _selectedIndex == index
                              ? const Color.fromARGB(255, 130, 143, 153)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Center(
                          child: Text(
                            category,
                            style: TextStyle(
                              color: _selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(16.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: _selectedIndex == 0
                      ? SebelumBanjirPage()
                      : _selectedIndex == 1
                          ? SaatBanjirPage()
                          : PascaBanjirPage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
