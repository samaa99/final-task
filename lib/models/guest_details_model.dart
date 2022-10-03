// class GuestDetailsModel {
//   String username;
//   String password_alt;
//   String email;
//   String first_name;
//   String last_name;
//   String img;
//   String contact_number;
//   String localId;
//   int entity_id;
//   String title;
//   String organization;
//   List<dynamic> companions;
//   List<dynamic> trips;
//
//   GuestDetailsModel({
//     required this.username,
//     required this.password_alt,
//     required this.email,
//     required this.first_name,
//     required this.last_name,
//     required this.img,
//     required this.contact_number,
//     required this.localId,
//     required this.entity_id,
//     required this.title,
//     required this.organization,
//     required this.companions,
//     required this.trips,
//   });
//
//   factory GuestDetailsModel.fromJson(Map<String, dynamic> jsonData) {
//     return GuestDetailsModel(
//       username: jsonData['username'],
//       password_alt: jsonData['password_alt'],
//       email: jsonData['email'],
//       first_name: jsonData['first_name'],
//       last_name: jsonData['last_name'],
//       img: jsonData['img'],
//       contact_number: jsonData['contact_number'],
//       localId: jsonData['localId'],
//       entity_id: jsonData['entity_id'],
//       title: jsonData['title'],
//       organization: jsonData['organization'],
//       companions: jsonData['companions'],
//       trips: jsonData['trips'].map((trip) => Trips.fromJson(trip)).toList(),
//     );
//   }
// }
//
// class Trips {
//   int id;
//   int user_id;
//   int package_id;
//   String status;
//   List<dynamic> matches;
//
//   Trips({
//     required this.id,
//     required this.user_id,
//     required this.package_id,
//     required this.status,
//     required this.matches,
//   });
//
//   factory Trips.fromJson(Map<String, dynamic> jsonData) {
//     return Trips(
//       id: jsonData['id'],
//       user_id: jsonData['user_id'] ?? 0,
//       package_id: jsonData['package_id'] ?? 0,
//       status: jsonData['status'],
//       matches: jsonData['matches'].map((trip) => Trips.fromJson(trip)).toList(),
//     );
//   }
// }
//
// class MatchesModel {
//   int id;
//   String first_team;
//   String second_team;
//   String from;
//   String till;
//   String date;
//
//   MatchesModel({
//     required this.id,
//     required this.first_team,
//     required this.second_team,
//     required this.from,
//     required this.till,
//     required this.date,
//   });
//
//   factory MatchesModel.fromJson(Map<String, dynamic> jsonData) {
//     return MatchesModel(
//       id: jsonData['id'],
//       first_team: jsonData['first_team'],
//       second_team: jsonData['second_team'],
//       from: jsonData['from'],
//       till: jsonData['till'],
//       date: jsonData['date'],
//     );
//   }
// }
//---------------------------------------------------------------

class GuestDetailsModel {
  String? username;
  String? passwordAlt;
  String? email;
  String? firstName;
  String? lastName;
  String? img;
  String? contactNumber;
  String? localId;
  int? entityId;
  String? title;
  String? organization;
  int? contactPointId;
  int? packageId;
  String? featuresValues;
  String? hashId;
  int? invitaionId;
  Entity? entity;
  List<Groups>? groups;
  ContactPoint? contactPoint;
  List<Trips>? trips;

  GuestDetailsModel(
      {this.username,
      this.passwordAlt,
      this.email,
      this.firstName,
      this.lastName,
      this.img,
      this.contactNumber,
      this.localId,
      this.entityId,
      this.title,
      this.organization,
      this.contactPointId,
      this.packageId,
      this.featuresValues,
      this.hashId,
      this.invitaionId,
      this.entity,
      this.groups,
      this.contactPoint,
      this.trips});

  GuestDetailsModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    passwordAlt = json['password_alt'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    img = json['img'];
    contactNumber = json['contact_number'];
    localId = json['localId'];
    entityId = json['entity_id'];
    title = json['title'];
    organization = json['organization'];
    contactPointId = json['contact_point_id'];
    packageId = json['package_id'];
    featuresValues = json['features_values'];
    hashId = json['hash_id'];
    invitaionId = json['invitaion_id'];
    entity = json['entity'] != null ? Entity.fromJson(json['entity']) : null;
    if (json['groups'] != null) {
      groups = <Groups>[];
      json['groups'].forEach((v) {
        groups!.add(Groups.fromJson(v));
      });
    }
    contactPoint = json['contact_point'] != null
        ? ContactPoint.fromJson(json['contact_point'])
        : null;
    if (json['trips'] != null) {
      trips = <Trips>[];
      json['trips'].forEach((v) {
        trips!.add(Trips.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['username'] = username;
    data['password_alt'] = passwordAlt;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['img'] = img;
    data['contact_number'] = contactNumber;
    data['localId'] = localId;
    data['entity_id'] = entityId;
    data['title'] = title;
    data['organization'] = organization;
    data['contact_point_id'] = contactPointId;
    data['package_id'] = packageId;
    data['features_values'] = featuresValues;
    data['hash_id'] = hashId;
    data['invitaion_id'] = invitaionId;
    if (entity != null) {
      data['entity'] = entity!.toJson();
    }
    if (groups != null) {
      data['groups'] = groups!.map((v) => v.toJson()).toList();
    }
    if (contactPoint != null) {
      data['contact_point'] = contactPoint!.toJson();
    }
    if (trips != null) {
      data['trips'] = trips!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Entity {
  int? id;
  String? name;
  String? placeholder;
  String? createdAt;
  String? updatedAt;
  int? priority;
  bool? manyTrips;
  bool? canSelect;

  Entity(
      {this.id,
      this.name,
      this.placeholder,
      this.createdAt,
      this.updatedAt,
      this.priority,
      this.manyTrips,
      this.canSelect});

  Entity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    placeholder = json['placeholder'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    priority = json['priority'];
    manyTrips = json['many_trips'];
    canSelect = json['can_select'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['placeholder'] = placeholder;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['priority'] = priority;
    data['many_trips'] = manyTrips;
    data['can_select'] = canSelect;
    return data;
  }
}

class Groups {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  int? adminId;
  bool? automateNotify;
  int? entityId;

  Groups(
      {this.id,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.adminId,
      this.automateNotify,
      this.entityId});

  Groups.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    adminId = json['admin_id'];
    automateNotify = json['automate_notify'];
    entityId = json['entity_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['admin_id'] = adminId;
    data['automate_notify'] = automateNotify;
    data['entity_id'] = entityId;
    return data;
  }
}

class ContactPoint {
  int? id;
  int? entityId;
  String? firstName;
  String? lastName;
  String? image;
  String? contactNumber;
  String? email;
  String? createdAt;
  String? updatedAt;

  ContactPoint(
      {this.id,
      this.entityId,
      this.firstName,
      this.lastName,
      this.image,
      this.contactNumber,
      this.email,
      this.createdAt,
      this.updatedAt});

  ContactPoint.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    entityId = json['entity_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    image = json['image'];
    contactNumber = json['contact_number'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['entity_id'] = entityId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['image'] = image;
    data['contact_number'] = contactNumber;
    data['email'] = email;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Trips {
  int? id;
  int? userId;
  int? packageId;
  String? status;
  String? comment;
  String? createdAt;
  String? updatedAt;
  String? featuresValues;
  String? statusByOwner;
  int? ownerCounter;
  String? statusByEntity;
  int? entityCounter;
  String? statusChangedDate;
  int? btnClicked;
  String? btnEdited;
  String? guestComment;
  String? statusByGuest;
  bool? showButton;
  List<Matches>? matches;
  Package? package;
  List<Reservations>? reservations;

  Trips(
      {this.id,
      this.userId,
      this.packageId,
      this.status,
      this.comment,
      this.createdAt,
      this.updatedAt,
      this.featuresValues,
      this.statusByOwner,
      this.ownerCounter,
      this.statusByEntity,
      this.entityCounter,
      this.statusChangedDate,
      this.btnClicked,
      this.btnEdited,
      this.guestComment,
      this.statusByGuest,
      this.showButton,
      this.matches,
      this.package,
      this.reservations});

  Trips.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    packageId = json['package_id'];
    status = json['status'];
    comment = json['comment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    featuresValues = json['features_values'];
    statusByOwner = json['status_by_owner'];
    ownerCounter = json['owner_counter'];
    statusByEntity = json['status_by_entity'];
    entityCounter = json['entity_counter'];
    statusChangedDate = json['status_changed_date'];
    btnClicked = json['btn_clicked'];
    btnEdited = json['btn_edited'];
    guestComment = json['guest_comment'];
    statusByGuest = json['status_by_guest'];
    showButton = json['show_button'];
    if (json['matches'] != null) {
      matches = <Matches>[];
      json['matches'].forEach((v) {
        matches!.add(Matches.fromJson(v));
      });
    }
    package =
        json['package'] != null ? Package.fromJson(json['package']) : null;
    if (json['reservations'] != null) {
      reservations = <Reservations>[];
      json['reservations'].forEach((v) {
        reservations!.add(Reservations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['package_id'] = packageId;
    data['status'] = status;
    data['comment'] = comment;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['features_values'] = featuresValues;
    data['status_by_owner'] = statusByOwner;
    data['owner_counter'] = ownerCounter;
    data['status_by_entity'] = statusByEntity;
    data['entity_counter'] = entityCounter;
    data['status_changed_date'] = statusChangedDate;
    data['btn_clicked'] = btnClicked;
    data['btn_edited'] = btnEdited;
    data['guest_comment'] = guestComment;
    data['status_by_guest'] = statusByGuest;
    data['show_button'] = showButton;
    if (matches != null) {
      data['matches'] = matches!.map((v) => v.toJson()).toList();
    }
    if (package != null) {
      data['package'] = package!.toJson();
    }
    if (reservations != null) {
      data['reservations'] = reservations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Matches {
  int? id;
  String? coverImage;
  String? firstTeam;
  String? secondTeam;
  String? matchSubtitle;
  String? description;
  String? from;
  String? till;
  String? date;
  int? stadiumId;
  String? matchGroup;
  String? number;
  bool? isApproved;
  String? createdAt;
  String? updatedAt;
  int? capacity;

  Matches(
      {this.id,
      this.coverImage,
      this.firstTeam,
      this.secondTeam,
      this.matchSubtitle,
      this.description,
      this.from,
      this.till,
      this.date,
      this.stadiumId,
      this.matchGroup,
      this.number,
      this.isApproved,
      this.createdAt,
      this.updatedAt,
      this.capacity});

  Matches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    coverImage = json['cover_image'];
    firstTeam = json['first_team'];
    secondTeam = json['second_team'];
    matchSubtitle = json['match_subtitle'];
    description = json['description'];
    from = json['from'];
    till = json['till'];
    date = json['date'];
    stadiumId = json['stadium_id'];
    matchGroup = json['match_group'];
    number = json['number'];
    isApproved = json['is_approved'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    capacity = json['capacity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['cover_image'] = coverImage;
    data['first_team'] = firstTeam;
    data['second_team'] = secondTeam;
    data['match_subtitle'] = matchSubtitle;
    data['description'] = description;
    data['from'] = from;
    data['till'] = till;
    data['date'] = date;
    data['stadium_id'] = stadiumId;
    data['match_group'] = matchGroup;
    data['number'] = number;
    data['is_approved'] = isApproved;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['capacity'] = capacity;
    return data;
  }
}

class Package {
  int? id;
  String? image;
  String? title;
  String? createdAt;
  String? updatedAt;
  int? priority;
  List<Features>? features;
  List<RoomTypes>? roomTypes;

  Package(
      {this.id,
      this.image,
      this.title,
      this.createdAt,
      this.updatedAt,
      this.priority,
      this.features,
      this.roomTypes});

  Package.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    priority = json['priority'];
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features!.add(Features.fromJson(v));
      });
    }
    if (json['room_types'] != null) {
      roomTypes = <RoomTypes>[];
      json['room_types'].forEach((v) {
        roomTypes!.add(RoomTypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['image'] = image;
    data['title'] = title;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['priority'] = priority;
    if (features != null) {
      data['features'] = features!.map((v) => v.toJson()).toList();
    }
    if (roomTypes != null) {
      data['room_types'] = roomTypes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Features {
  int? id;
  int? packageId;
  String? icon;
  String? name;
  String? featureType;
  String? options;
  String? createdAt;
  String? updatedAt;

  Features(
      {this.id,
      this.packageId,
      this.icon,
      this.name,
      this.featureType,
      this.options,
      this.createdAt,
      this.updatedAt});

  Features.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packageId = json['package_id'];
    icon = json['icon'];
    name = json['name'];
    featureType = json['feature_type'];
    options = json['options'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['package_id'] = packageId;
    data['icon'] = icon;
    data['name'] = name;
    data['feature_type'] = featureType;
    data['options'] = options;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class RoomTypes {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  RoomTypes({this.id, this.name, this.createdAt, this.updatedAt});

  RoomTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Reservations {
  int? id;
  int? userId;
  int? tripId;
  List<String>? dates;
  String? guestSpecialRequest;
  String? createdAt;
  String? updatedAt;
  String? statusByStay;
  String? message;
  List<Rooms>? rooms;

  Reservations(
      {this.id,
      this.userId,
      this.tripId,
      this.dates,
      this.guestSpecialRequest,
      this.createdAt,
      this.updatedAt,
      this.statusByStay,
      this.message,
      this.rooms});

  Reservations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    tripId = json['trip_id'];
    dates = json['dates'].cast<String>();
    guestSpecialRequest = json['guest_special_request'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    statusByStay = json['status_by_stay'];
    message = json['message'];
    if (json['rooms'] != null) {
      rooms = <Rooms>[];
      json['rooms'].forEach((v) {
        rooms!.add(Rooms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['trip_id'] = tripId;
    data['dates'] = dates;
    data['guest_special_request'] = guestSpecialRequest;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['status_by_stay'] = statusByStay;
    data['message'] = message;
    if (rooms != null) {
      data['rooms'] = rooms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rooms {
  int? id;
  String? roomNumber;
  int? roomCapacity;
  String? amenities;
  List<String>? roomImages;
  List<String>? availableDates;
  int? stayId;
  int? roomTypeId;
  String? createdAt;
  String? updatedAt;
  Stay? stay;
  RoomTypes? roomType;

  Rooms(
      {this.id,
      this.roomNumber,
      this.roomCapacity,
      this.amenities,
      this.roomImages,
      this.availableDates,
      this.stayId,
      this.roomTypeId,
      this.createdAt,
      this.updatedAt,
      this.stay,
      this.roomType});

  Rooms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomNumber = json['room_number'];
    roomCapacity = json['room_capacity'];
    amenities = json['amenities'];
    roomImages = json['room_images'].cast<String>();
    availableDates = json['available_dates'].cast<String>();
    stayId = json['stay_id'];
    roomTypeId = json['room_type_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    stay = json['stay'] != null ? Stay.fromJson(json['stay']) : null;
    roomType = json['room_type'] != null
        ? RoomTypes.fromJson(json['room_type'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['room_number'] = roomNumber;
    data['room_capacity'] = roomCapacity;
    data['amenities'] = amenities;
    data['room_images'] = roomImages;
    data['available_dates'] = availableDates;
    data['stay_id'] = stayId;
    data['room_type_id'] = roomTypeId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (stay != null) {
      data['stay'] = stay!.toJson();
    }
    if (roomType != null) {
      data['room_type'] = roomType!.toJson();
    }
    return data;
  }
}

class Stay {
  int? id;
  String? name;
  String? description;
  String? lat;
  String? long;
  String? address;
  int? stars;
  String? contactNumber;
  String? website;
  String? chainAffiliation;
  String? checkIn;
  String? checkOut;
  String? amenities;
  List<String>? photos;
  String? createdAt;
  String? updatedAt;
  String? email;
  String? username;

  Stay({
    this.id,
    this.name,
    this.description,
    this.lat,
    this.long,
    this.address,
    this.stars,
    this.contactNumber,
    this.website,
    this.chainAffiliation,
    this.checkIn,
    this.checkOut,
    this.amenities,
    this.photos,
    this.createdAt,
    this.updatedAt,
    this.email,
    this.username,
  });

  Stay.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    lat = json['lat'];
    long = json['long'];
    address = json['address'];
    stars = json['stars'];
    contactNumber = json['contact_number'];
    website = json['website'];
    chainAffiliation = json['chain_affiliation'];
    checkIn = json['check_in'];
    checkOut = json['check_out'];
    amenities = json['amenities'];
    photos = json['photos'].cast<String>();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    email = json['email'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['lat'] = lat;
    data['long'] = long;
    data['address'] = address;
    data['stars'] = stars;
    data['contact_number'] = contactNumber;
    data['website'] = website;
    data['chain_affiliation'] = chainAffiliation;
    data['check_in'] = checkIn;
    data['check_out'] = checkOut;
    data['amenities'] = amenities;
    data['photos'] = photos;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['email'] = email;
    data['username'] = username;
    return data;
  }
}
