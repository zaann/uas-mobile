import 'package:flutter/material.dart';

class MitigasiBencanaPage extends StatefulWidget {
  const MitigasiBencanaPage({Key? key}) : super(key: key);

  @override
  _MitigasiBencanaPageState createState() => _MitigasiBencanaPageState();
}

class _MitigasiBencanaPageState extends State<MitigasiBencanaPage> {
  int _selectedIndex = 0;

  static const List<String> _categories = [
    'Banjir',
    'Gempa Bumi',
  ];

  static const List<List<String>> _mitigations = [
    [
      'Membangun tanggul atau bendungan untuk menahan aliran air.',
      'Meningkatkan sistem drainase untuk mengalirkan air dengan baik.',
      'Melakukan penanaman pohon dan penghijauan untuk mencegah erosi dan meningkatkan penyerapan air.',
    ],
    [
      'Membangun bangunan yang kuat dan tahan gempa.',
      'Mengamankan benda-benda berat agar tidak mudah jatuh saat terjadi gempa.',
      'Menyiapkan rencana evakuasi dan tempat penampungan sementara.',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mitigasi Bencana'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Mitigasi Bencana',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _selectedIndex == index
                            ? Colors.blue
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
            child: IndexedStack(
              index: _selectedIndex,
              children: _categories.map((category) {
                int index = _categories.indexOf(category);
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _mitigations[index].map((mitigation) {
                      return Text(
                        mitigation,
                        style: const TextStyle(fontSize: 16.0),
                      );
                    }).toList(),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
