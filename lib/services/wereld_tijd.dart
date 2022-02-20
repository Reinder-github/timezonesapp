import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WereldTijd {

  String locatie;
  String tijd = '';
  String vlag;
  String url;
  late bool isDagLicht;

  WereldTijd({required this.locatie, required this.vlag, required this.url});

  Future<void> getTime() async{

    try {
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      String datetime = ((data['datetime']).substring(0,data['datetime'].length - 6));
      DateTime nu = DateTime.parse(datetime);

      tijd = DateFormat.Hm().format(nu);

      isDagLicht = nu.hour > 6 && nu.hour < 20;

    }
    catch (e) {
      tijd = 'Kon tijd niet vinden';
    }
  }

}

