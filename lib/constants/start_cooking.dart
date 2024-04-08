
import 'package:url_launcher/url_launcher.dart';

class StartCooking{ // for navigating to cooking website for detail
  static Future<void> startCooking(String url)async{
     final recipe=Uri.parse(url);
     if(!await launchUrl(recipe)){
       throw Exception('cloud not launch');
     }
  }
}