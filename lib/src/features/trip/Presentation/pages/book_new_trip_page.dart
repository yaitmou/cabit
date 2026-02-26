import 'package:cabit/src/features/trip/Presentation/bloc/trip_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class BookNewTripPage extends StatelessWidget {
  const BookNewTripPage({super.key});

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
              width: 300,
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
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          onChanged: (value) {
                            // This triggers our debounced BLoC event
                            context.read<TripBloc>().add(LocationQueryChanged(value));
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: "Enter pickup location...",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 300,
                        child: BlocBuilder<TripBloc, TripState>(
                          builder: (context, state) {
                            if (state is LocationSuggestionsLoading) {
                              return const Center(child: CircularProgressIndicator());
                            }

                            if (state is LocationSuggestionsError) {
                              return Center(child: Text(state.message));
                            }

                            if (state is LocationSuggestionsLoaded) {
                              final suggestions = state.suggestions;

                              if (suggestions.isEmpty) {
                                return const Center(child: Text("No locations found."));
                              }

                              return ListView.separated(
                                itemCount: suggestions.length,
                                separatorBuilder: (context, index) => const Divider(),
                                itemBuilder: (context, index) {
                                  final location = suggestions[index];
                                  return ListTile(
                                    leading: const Icon(Icons.location_on_outlined),
                                    title: Text(
                                      location.placeName,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    subtitle: Text(
                                      "Lat: ${location.lat.toStringAsFixed(4)}, Lon: ${location.lon.toStringAsFixed(4)}",
                                    ),
                                    onTap: () {
                                      // Handle selection (e.g., move to next step or set pin)
                                      print("Selected: ${location.placeName}");
                                    },
                                  );
                                },
                              );
                            }

                            return const Center(child: Text("Start typing to search..."));
                          },
                        ),
                      ),
                      //
                      //
                      //
                      // Listen the event emitted by the bloc

                      //
                      //
                      //
                      SizedBox(height: 8),
                      // to Field
                      TextField(
                        decoration: InputDecoration(labelText: 'To', icon: Icon(Icons.location_on)),
                      ),
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
