import 'dart:convert';

class GeoCodingModel {
    GeoCodingModel({
        required this.results,
        required this.status,
    });

    final List<Result> results;
    final String status;

    factory GeoCodingModel.fromRawJson(String str) => GeoCodingModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GeoCodingModel.fromJson(Map<String, dynamic> json) => GeoCodingModel(
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "status": status,
    };
}

class Result {
    Result({
        required this.addressComponents,
        required this.formattedAddress,
        required this.geometry,
        required this.placeId,
        required this.types,
    });

    final List<AddressComponent> addressComponents;
    final String formattedAddress;
    final Geometry geometry;
    final String placeId;
    final List<String> types;

    factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        addressComponents: List<AddressComponent>.from(json["address_components"].map((x) => AddressComponent.fromJson(x))),
        formattedAddress: json["formatted_address"],
        geometry: Geometry.fromJson(json["geometry"]),
        placeId: json["place_id"],
        types: List<String>.from(json["types"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "address_components": List<dynamic>.from(addressComponents.map((x) => x.toJson())),
        "formatted_address": formattedAddress,
        "geometry": geometry.toJson(),
        "place_id": placeId,
        "types": List<dynamic>.from(types.map((x) => x)),
    };
}

class AddressComponent {
    AddressComponent({
        required this.longName,
        required this.shortName,
        required this.types,
    });

    final String longName;
    final String shortName;
    final List<String> types;

    factory AddressComponent.fromRawJson(String str) => AddressComponent.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddressComponent.fromJson(Map<String, dynamic> json) => AddressComponent(
        longName: json["long_name"],
        shortName: json["short_name"],
        types: List<String>.from(json["types"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "long_name": longName,
        "short_name": shortName,
        "types": List<dynamic>.from(types.map((x) => x)),
    };
}

class Geometry {
    Geometry({
        required this.location,
    });

    final Location location;

    factory Geometry.fromRawJson(String str) => Geometry.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        location: Location.fromJson(json["location"]),
    );

    Map<String, dynamic> toJson() => {
        "location": location.toJson(),
    };
}

class Location {
    Location({
        required this.lat,
        required this.lng,
    });

    final double lat;
    final double lng;

    factory Location.fromRawJson(String str) => Location.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
    };
}
