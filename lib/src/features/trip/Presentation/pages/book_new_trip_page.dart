import 'package:cabit/src/features/trip/Presentation/bloc/trip_bloc.dart';
import 'package:cabit/src/features/trip/Presentation/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class BookNewTripPage extends StatefulWidget {
  const BookNewTripPage({super.key});

  @override
  State<BookNewTripPage> createState() => _BookNewTripPageState();
}

class _BookNewTripPageState extends State<BookNewTripPage> {
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. BACKGROUND MAP
          FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(51.509364, -0.128928), // London
              initialZoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.your_app.name', // Required by OSM
              ),
            ],
          ),

          // 2. BOTTOM OVERLAY
          Align(
            alignment: AlignmentDirectional.bottomCenter,

            child: SizedBox(
              width: 400,
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // The from field
                      // 1. Search Input
                      LocationSearch(controller: fromController),
                      SizedBox(height: 16),
                      LocationSearch(controller: toController),

                      SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () => print("Booking initiated!"),
                          child: Text("Book Now"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
