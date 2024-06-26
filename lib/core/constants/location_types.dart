enum LocationTypes {country, county, subcounty, location, sublocation, orgunit, ward}

extension LocationTypesExtension on LocationTypes {
  String get value {
    switch(this) {
      case LocationTypes.country:
        return "country";
      case LocationTypes.county:
        return "GPRV";
      case LocationTypes.subcounty:
        return "GDIS";
      case LocationTypes.location:
        return "GLOC";
      case LocationTypes.sublocation:
        return "GSLC";
      case LocationTypes.orgunit:
        return "orgunit";
      case LocationTypes.ward:
        return "GWRD";
      default:
        throw "Invalid Location Type";
    }
  }
}