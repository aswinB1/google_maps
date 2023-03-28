import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class GoogleMaps extends StatefulWidget {
  GoogleMaps({super.key});

  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  var controller = WebViewController();
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse("https://www.google.com/maps/@,15z"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Locations", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.blue[200],
      ),
      floatingActionButton: Row(
        
        children: [
          FloatingActionButton(
            onPressed: () async {
              Location location = Location();
              await location.getLocation();

              var datalocation = await location.getLocation();
              var latitudeloc = datalocation.latitude;
              print("latitude $latitudeloc");
              var logitudeloc = datalocation.longitude;
              print("longitude $logitudeloc");

              controller.loadRequest(Uri.parse(
                  'https://www.google.com/maps/@$latitudeloc,$logitudeloc,15z'));
            },
            child: Icon(Icons.location_on),
          ),
          FloatingActionButton(onPressed: () async {
            Location location = Location();
            await location.getLocation();
          
            // var datalocation = await location.getLocation();
            // var secondlatitude = datalocation.latitude;
            // print("latitude $secondlatitude");
            // var secondlogitude = datalocation.longitude;
            // print("longitude $secondlogitude");
          
            controller.loadRequest(Uri.parse(
                'https://www.google.com/maps/@https://www.google.com/maps/place/Churuli,+Chelachuvadu,+Kerala+685606/@9.9172645,76.9588584,17z/'));
          },child: Icon(Icons.location_searching_rounded),
          backgroundColor:Colors.red ,
          ),
        ],
      ),

      body: SafeArea(
        child: WebViewWidget(controller: controller),
      ),

      // SafeArea(
      //     child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [Center(
      //     child: ElevatedButton(onPressed: () async {
      //
      //   var datalocation= await location.getLocation();
      // var latitudeloc= datalocation.latitude;
      //  print("latitude $latitudeloc");
      //   var logitudeloc=datalocation.longitude;
      //   print("longitude $logitudeloc");
      //   var aquracyloc=datalocation.accuracy;
      //   print("aquracy$aquracyloc");
      //   var speedloc=datalocation.speed;
      //   print("speed$speedloc");
      //   var altitudeloc=datalocation.altitude;
      //   print("altitude $altitudeloc");
      //     }, child: Text("search"),),
      //   )],
      // )),
    );
  }
}
