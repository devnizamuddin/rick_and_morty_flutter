class CharacterDetailModel {
  String? name;
  String? status;
  String? species;
  String? gender;
  String? image;
  OriginModel? originModel;
  LocationModel? locationModel;
  List<EpisodeModel>? episodeModelList;
  CharacterDetailModel({
    this.name,
    this.status,
    this.species,
    this.gender,
    this.image,
    this.originModel,
    this.locationModel,
    this.episodeModelList,
  });

  factory CharacterDetailModel.fromMap(Map<String, dynamic> map) {
    return CharacterDetailModel(
      name: map['name'] != null ? map['name'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      species: map['species'] != null ? map['species'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      originModel: map['origin'] != null
          ? OriginModel.fromMap(map['origin'] as Map<String, dynamic>)
          : null,
      locationModel: map['location'] != null
          ? LocationModel.fromMap(map['location'] as Map<String, dynamic>)
          : null,
      episodeModelList: map['episode'] != null
          ? (map['episode'] as List)
              .map((e) => EpisodeModel.fromMap(e))
              .toList()
          : null,
    );
  }
}

class OriginModel {
  String? name;
  OriginModel({
    this.name,
  });

  factory OriginModel.fromMap(Map<String, dynamic> map) {
    return OriginModel(
      name: map['name'] != null ? map['name'] as String : null,
    );
  }
}

class LocationModel {
  String? name;
  LocationModel({
    this.name,
  });
  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      name: map['name'] != null ? map['name'] as String : null,
    );
  }
}

class EpisodeModel {
  String? name;
  EpisodeModel({
    this.name,
  });
  factory EpisodeModel.fromMap(Map<String, dynamic> map) {
    return EpisodeModel(
      name: map['name'] != null ? map['name'] as String : null,
    );
  }
}
