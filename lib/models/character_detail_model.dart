



class CharacterDetailModel {
  String? name;
  String? status;
  String? species;
  String? gender;
  String? image;
  OriginModel? originModel;
  LocationModel? locationModel;
  List<EpisodeModel>? episodeModel;
  CharacterDetailModel({
    this.name,
    this.status,
    this.species,
    this.gender,
    this.image,
    this.originModel,
    this.locationModel,
    this.episodeModel,
  });

  factory CharacterDetailModel.fromMap(Map<String, dynamic> map) {
    return CharacterDetailModel(
      name: map['name'] != null ? map['name'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      species: map['species'] != null ? map['species'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      originModel: map['originModel'] != null
          ? OriginModel.fromMap(map['originModel'] as Map<String, dynamic>)
          : null,
      locationModel: map['locationModel'] != null
          ? LocationModel.fromMap(map['locationModel'] as Map<String, dynamic>)
          : null,
      episodeModel: map['episodeModel'] != null
          ? List<EpisodeModel>.from(
              (map['episodeModel'] as List<int>).map<EpisodeModel?>(
                (x) => EpisodeModel.fromMap(x as Map<String, dynamic>),
              ),
            )
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
