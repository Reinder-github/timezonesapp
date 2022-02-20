import 'package:flutter/material.dart';
import 'package:klok/services/wereld_tijd.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class laad extends StatefulWidget {
  const laad({Key? key}) : super(key: key);

  @override
  _laadState createState() => _laadState();
}

class _laadState extends State<laad> {

  String tijd = 'Aan het laden';

  void setupWorldTime() async{
    WereldTijd instantie = WereldTijd(locatie: 'Amsterdam', vlag: 'Netherlands.png', url: '/Europe/Amsterdam/');
    await instantie.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'locatie': instantie.locatie, 'vlag': instantie.vlag, 'tijd': instantie.tijd, 'isDagLicht': instantie.isDagLicht
    });

  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: SpinKitPulse(
            color: Colors.black,
            size: 50.0,
          ),
        ),
     );
  }
}
