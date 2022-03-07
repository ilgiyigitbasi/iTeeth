
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iteeth/constants.dart';

class Profile extends StatefulWidget {
  Profile({Key? key, required this.displayName, required this.uid}) : super(key: key);

  String? displayName;
  String? uid;
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
   bool isSwitched= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: const Color.fromRGBO(1, 24, 38, 1),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
          Image.asset('assets/mobile-phone.png', height: 100,),
          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Text('İsim Soyisim:', style: TextStyle(fontWeight: FontWeight.bold),),
                Text(widget.displayName.toString()),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Bildirim Gönder'),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;

                    });
                  },
                  activeTrackColor: const Color.fromRGBO(1, 24, 38, 1),
                  activeColor: Colors.white,
                ),
              ],
            ),
          ),Divider(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               TextButton(onPressed: ()=> {FirebaseAuth.instance.signOut().then((value) => print('signed out')), Navigator.pushNamed(context, login_view_route,)},
               child: Text('Çıkış Yap', style: TextStyle(color: Colors.red),),)
              ],
            ),
          ),
        ],
      )
    );
  }
}
