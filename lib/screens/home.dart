import 'package:flutter/material.dart';
import 'package:iteeth/Screens/appointment.dart';
import 'package:iteeth/Screens/buttons_main.dart';
import 'package:iteeth/Screens/settings.dart';

class Home extends StatefulWidget {

  const Home({Key? key, required this.userName}) : super(key: key);
  final String userName;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0;
  late List<Widget> children;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    @override
    void initState() {
      super.initState();
      children = [
        ButtonsMain(displayName: widget.userName,),
        Appointments(),
        Settings(),
        const Text(
          'Index 2: School',
          style: optionStyle,
        ),
      ];
    }

  static const List<String> _appBarTitles = <String>[
    'Ana Sayfa',
    'Randevularım'
    'Ayarlar',
    'Hesabım'
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar:true,
      body: children[_selectedIndex],
      bottomNavigationBar: Container(
        height: size.height*0.09,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(1, 24, 38, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25)
          ),
          boxShadow: [
            BoxShadow(
             color: Color.fromRGBO(1, 24, 38, 0.6),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3)
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.only(top:10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                  icon: _selectedIndex == 0
                      ? const Icon(
                    Icons.home_filled,
                    color: Colors.white,
                    size: 25,
                  )
                      : const Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                  icon: _selectedIndex == 1
                      ? const Icon(
                    Icons.settings_rounded,
                    color: Colors.white,
                    size: 30,
                  )
                      : const Icon(
                    Icons.settings_rounded,
                    color: Colors.white,
                    size: 25,
                  ),
                ),IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                  icon: _selectedIndex == 2
                      ? const Icon(
                    Icons.alarm,
                    color: Colors.white,
                    size: 25,
                  )
                      : const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ],

          ),
        ),
      ),
    );
  }
}