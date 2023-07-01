import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uts/pemberitahuan.dart';
import 'package:flutter_uts/resikobencana.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
      // appBar: AppBar(
      //   title: Text("Home Page"),
      // ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // Logika untuk pencarian
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {
                      // Logika untuk notifikasi
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PemberitahuanPage(),
                          ));
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 620),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                backgroundColor: MaterialStatePropertyAll(Color(0xFF5C5A7F)),
              ),
              onPressed: () {
                // Logika untuk melihat resiko bencana di sekitar Anda
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResikoBencanaPage(),
                    ));
              },
              child: Text("Lihat Resiko Bencana di Sekitar Anda"),
            ),

            // Text("Selamat Datang di Menu Utama"),
            // ElevatedButton.icon(
            //   style: ButtonStyle(
            //     shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            //       RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(30.0),
            //       ),
            //     ),
            //     backgroundColor: MaterialStatePropertyAll(Colors.red),
            //   ),
            //   onPressed: logOut,
            //   icon: Icon(Icons.logout_outlined),
            //   label: Text("Logout!"),
            // ),
          ],
        ),
      ),
    );
  }

  void logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
