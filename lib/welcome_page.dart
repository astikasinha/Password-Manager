import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:password_manager/save_password.dart';
import 'package:password_manager/view_password.dart';
import 'package:share_plus/share_plus.dart';
import 'package:password_manager/biometric_auth.dart';
import 'package:password_manager/information_page.dart';
import 'package:password_manager/sidebar.dart';

enum DrawerSections { dashboard, HomePage, InformationPage, BiometricPage }

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  var currentPage = DrawerSections.dashboard;

  void shareApp() {
    Share.share('com.example.password_manager');
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.yellow,
            animationDuration: Duration(milliseconds: 300),
            onTap: (int id) {
              setState(() {
                if (id == 0) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InformationPage()));
                } else if (id == 1) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomePage()));
                } else if (id == 2) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BiometricAuth()));
                }
              });
            },
            items: [
              Icon(Icons.insert_drive_file),
              Icon(Icons.home_outlined),
              Icon(Icons.key),
            ],
          ),
          appBar: AppBar(
            backgroundColor: Colors.blue[200],
            elevation: 0,
            title: Align(
              alignment: Alignment.center,
              child: const Text('Home'),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  shareApp();
                },
                icon: const Icon(Icons.share),
              ),
            ],
          ),
          drawer: Drawer(
            child: Column(
              children: [
                sidebar(),
                mydrawerlist(),
              ],
            ),
          ),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Digital key blue RGB color icon.jpg',
                  height: 200,
                ),
                Container(
                  color: Colors.blue[50],
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Select Your Choice!!",
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'kalnia',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  child: Text("Save Your Password Here", style: TextStyle(color: Colors.black, fontSize: 35)),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SecurityKey()));
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  child: Text("View Your Password Here", style: TextStyle(color: Colors.black, fontSize: 35)),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => KeyPage()));
                  },
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget mydrawerlist() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          menuitem(0, "Dashboard", Icons.dashboard_outlined, currentPage == DrawerSections.dashboard),
          menuitem(1, "Information Page", Icons.notes_outlined, currentPage == DrawerSections.InformationPage),
          menuitem(2, "Biometric Page", Icons.key, currentPage == DrawerSections.BiometricPage),
        ],
      ),
    );
  }

  Widget menuitem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() {
            currentPage = DrawerSections.values[id];
          });
          Navigator.pop(context); // Close the drawer
          if (id == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomePage()));
          } else if (id == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => InformationPage()));
          } else if (id == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => BiometricAuth()));
          }
        },
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(child: Text(title, style: TextStyle(color: Colors.black, fontSize: 16))),
            ],
          ),
        ),
      ),
    );
  }
}
