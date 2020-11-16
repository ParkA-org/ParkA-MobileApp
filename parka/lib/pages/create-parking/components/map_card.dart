import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PositionPickerWidget extends StatefulWidget {
  final Function onTapHandler;

  const PositionPickerWidget({
    Key key,
    this.onTapHandler,
  }) : super(key: key);

  @override
  _PositionPickerWidgetState createState() => _PositionPickerWidgetState();
}

class _PositionPickerWidgetState extends State<PositionPickerWidget> {
  Set<Marker> markers = {};
  BitmapDescriptor markerIcon;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, 'resources/images/green-parking-icon.png')
        .then((onValue) {
      markerIcon = onValue;
    });
  }

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
                markers: this.markers,
                initialCameraPosition: CameraPosition(
                  target: LatLng(18.487876, -69.9644807),
                  zoom: 15.5,
                ),
                onTap: (LatLng position) {
                  this.widget.onTapHandler(position);
                  setState(() {
                    this.markers = {
                      Marker(
                        icon: markerIcon,
                        markerId: MarkerId("Hello"),
                        position: position,
                      )
                    };
                  });
                },
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

// class PositionPickerWidget extends StatelessWidget {
//   final Function onTapHandler;

//   const PositionPickerWidget({
//     Key key,
//     this.onTapHandler,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return

//     Container(
//       alignment: Alignment.center,
//       margin: EdgeInsets.symmetric(horizontal: 16.0),
//       child: LayoutBuilder(builder: (ctx, constr) {
//         final double sideLength = constr.maxWidth > 350 ? 350 : constr.maxWidth;

//         return ConstrainedBox(
//           constraints: constr,
//           child: Container(
//             height: sideLength,
//             width: sideLength,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(16.0),
//               boxShadow: [
//                 BoxShadow(
//                   offset: Offset(3.0, 10.0),
//                   color: Colors.black38,
//                   blurRadius: 5.0,
//                 ),
//               ],
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(16.0),
//               child: GoogleMap(
//                 myLocationButtonEnabled: true,
//                 myLocationEnabled: true,
//                 zoomControlsEnabled: false,
//                 markers: {
//                   Marker(
//                     // icon: customIcon,
//                     markerId: MarkerId("Hello"),
//                     position: LatLng(18.487875, -69.9644807),
//                   )
//                 },
//                 initialCameraPosition: CameraPosition(
//                   target: LatLng(18.487876, -69.9644807),
//                   zoom: 15.5,
//                 ),
//                 onTap: (LatLng position) {
//                   this.onTapHandler(position);
//                 },
//                 gestureRecognizers: Set()
//                   ..add(Factory<EagerGestureRecognizer>(
//                       () => EagerGestureRecognizer())),
//               ),
//             ),
//           ),
//         );
//       }),
//     );

//   }
// }
