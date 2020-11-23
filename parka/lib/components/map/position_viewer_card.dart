import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PositionViewerWidget extends StatelessWidget {
  final LatLng position;
  final String parkingId;
  final BitmapDescriptor markerIcon;

  const PositionViewerWidget({
    Key key,
    this.parkingId,
    this.position,
    this.markerIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: LayoutBuilder(builder: (ctx, constr) {
        final double sideLength = constr.maxWidth > 350 ? 350 : constr.maxWidth;

        return ConstrainedBox(
          constraints: constr,
          child: Container(
            height: sideLength,
            width: sideLength,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  offset: Offset(3.0, 10.0),
                  color: Colors.black38,
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: GoogleMap(
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                markers: {
                  Marker(
                    icon: this.markerIcon ?? BitmapDescriptor.defaultMarker,
                    markerId: MarkerId(this.parkingId),
                    position: this.position,
                  )
                },
                initialCameraPosition: CameraPosition(
                  target: this.position,
                  zoom: 15.5,
                ),
                gestureRecognizers: Set()
                  ..add(Factory<EagerGestureRecognizer>(
                      () => EagerGestureRecognizer())),
              ),
            ),
          ),
        );
      }),
    );
  }
}
