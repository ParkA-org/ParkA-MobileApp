class Position {
  String latitude;
  String longitude;
  String sector;
  String direction;

  Position({
    this.direction,
    this.latitude,
    this.longitude,
    this.sector,
  });

  factory Position.fromJson(Map<String, dynamic> positionData) {
    Map<String, dynamic> addressInfo = positionData["address"];
    String positionInfo = positionData["position"];

    String _direction = addressInfo["freeformAddress"];
    String _sector = addressInfo["municipalitySubdivision"];
    String _latitude = positionInfo.split(",")[0];
    String _longitutde = positionInfo.split(",")[1];

    return new Position(
      direction: _direction,
      sector: _sector,
      latitude: _latitude,
      longitude: _longitutde,
    );
  }
}
