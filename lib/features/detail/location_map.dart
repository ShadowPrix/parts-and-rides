import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../core/theme.dart';

class LocationMap extends StatelessWidget {
  const LocationMap({super.key, required this.lat, required this.lng});
  final double lat, lng;

  @override
  Widget build(BuildContext context) {
    final point = LatLng(lat, lng);
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: 160,
        width: double.infinity,
        child: FlutterMap(
          options: MapOptions(
            initialCenter: point,
            initialZoom: 14,
            // Static preview so it never fights with page scrolling
            interactionOptions:
                const InteractionOptions(flags: InteractiveFlag.none),
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.parts_and_rides',
            ),
            CircleLayer(circles: [
              CircleMarker(
                point: point,
                radius: 300,
                useRadiusInMeter: true,
                color: AppColors.accent.withValues(alpha: 0.25),
                borderColor: AppColors.accent,
                borderStrokeWidth: 2,
              ),
            ]),
            const RichAttributionWidget(
              attributions: [TextSourceAttribution('OpenStreetMap contributors')],
            ),
          ],
        ),
      ),
    );
  }
}