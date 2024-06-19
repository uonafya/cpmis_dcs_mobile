enum LocationTypes {country, county, subcounty, location, sublocation, orgunit, ward}

extension LocationTypesExtension on LocationTypes {
  String get value {
    switch(this) {
      case LocationTypes.country:
        return "country";
      case LocationTypes.county:
        return "county";
      case LocationTypes.subcounty:
        return "subcounty";
      case LocationTypes.location:
        return "location";
      case LocationTypes.sublocation:
        return "sublocation";
      case LocationTypes.orgunit:
        return "orgunit";
      case LocationTypes.ward:
        return "ward";
      default:
        throw "Invalid Location Type";
    }
  }
}