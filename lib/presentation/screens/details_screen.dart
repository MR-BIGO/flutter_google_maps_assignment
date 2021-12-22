import 'package:flutter/material.dart';
import 'package:flutter_7_wonders_of_the_world/data/models/wordl_wonders.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late GoogleMapController mapController;

  bool _isExpanded = false;
  bool _didFinishAnimating = false;

  MapType _currentMapType = MapType.normal;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _changeMapType() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final Map parseData = ModalRoute.of(context)!.settings.arguments as Map;
    final WorldWonder wonder = parseData["wonder"];

    final LatLng center = wonder.latLong;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Location',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
              mapType: _currentMapType,
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(target: center, zoom: 11.0),
              markers: {
                Marker(
                    markerId: MarkerId(wonder.name),
                    position: wonder.latLong,
                    infoWindow: InfoWindow(
                        title: wonder.name, snippet: wonder.description),
                    icon: BitmapDescriptor.defaultMarker),
              }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedContainer(
              onEnd: () => setState(() {
                _didFinishAnimating = !_didFinishAnimating;
              }),
              duration: const Duration(milliseconds: 500),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              width: double.infinity,
              height: _isExpanded ? screenSize.height / 3 : 70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _isExpanded && _didFinishAnimating
                    ? Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              child: const Text('Change Map Type'),
                              onPressed: _changeMapType,
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              child: const Text('Options'),
                              onPressed: () => setState(() {
                                _isExpanded = !_isExpanded;
                              }),
                            ),
                          )
                        ],
                      )
                    : Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              child: const Text('Options'),
                              onPressed: () => setState(() {
                                _isExpanded = !_isExpanded;
                              }),
                            ),
                          )
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
