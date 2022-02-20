import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isEmpty ? ModalRoute.of(context)!.settings.arguments as Map : data;

    String aGrond = '';
    if (data['isDagLicht']) {aGrond = 'day.png';}
    else {aGrond = 'night.png';}

    return AnnotatedRegion <SystemUiOverlayStyle> (
        value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
    ),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$aGrond'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120,0,0),
              child: Column(
                children: <Widget>[
                  TextButton.icon(
                    onPressed: () async{
                        dynamic keuze = await Navigator.pushNamed(context, '/locatie');
                        setState(() {
                          data = {
                            'tijd': keuze['tijd'], 'locatie': keuze['locatie'],
                            'isDagLicht': keuze['isDagLicht'], 'vlag:' : keuze['vlag']
                          };
                        });
                      },
                    icon: const Icon(Icons.edit_location),
                    label: Text('Verander Locatie',
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontFamily: 'Lato',
                      ),
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.grey[300]
                    )
                  ),
                  const SizedBox(height:20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['locatie'],
                        style: const TextStyle(
                          fontSize: 20,
                          letterSpacing: 1,
                          fontFamily: 'Lato',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    data['tijd'],
                    style: const TextStyle(
                      fontSize: 64,
                      fontFamily: 'Lato',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    ),
    );
  }
}
