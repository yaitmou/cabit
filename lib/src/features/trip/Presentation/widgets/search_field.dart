import 'package:cabit/src/features/trip/Presentation/bloc/trip_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationSearch extends StatelessWidget {
  final TextEditingController controller;
  const LocationSearch({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: controller,
            onChanged: (value) {
              // This triggers our debounced BLoC event
              context.read<TripBloc>().add(LocationQueryChanged(value));
            },
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: "Enter dropoff location...",
              border: OutlineInputBorder(),
            ),
          ),
        ),

        SizedBox(
          height: 200,
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
                      title: Text(location.placeName, maxLines: 2, overflow: TextOverflow.ellipsis),
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
      ],
    );
  }
}
