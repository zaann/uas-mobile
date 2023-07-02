import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uts/pemberitahuan.dart';
import 'package:flutter_uts/resikobencana.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  void logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'lib/images/maps.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          // Logika untuk pencarian
                        },
                        child: Container(
                          width: 300,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                              bottom: Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Icon(Icons.search),
                              ),
                              SizedBox(width: 16.0),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      InkWell(
                        onTap: () {
                          // Logika untuk notifikasi
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PemberitahuanPage(),
                            ),
                          );
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Icon(Icons.notifications),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 620),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    elevation: MaterialStateProperty.all(
                        5), // Menambahkan efek bayangan
                  ),
                  onPressed: () {
                    // Logika untuk melihat resiko bencana di sekitar Anda
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResikoBencanaPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Lihat Resiko Bencana di Sekitar Anda",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
