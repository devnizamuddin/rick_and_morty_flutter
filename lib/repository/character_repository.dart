import 'package:rick_and_morty_flutter/models/character_detail_model.dart';

import '../config/query.dart';
import '../models/character_model.dart';
import '../service/api_communication.dart';

class CharacterRepository {
  ApiCommunication apiCommunication = ApiCommunication();

  Future<List<CharacterModel>?> fetchCharacter() async {
    final response = await apiCommunication.doPostRequest(
      apiEndPoint: '',
      query: getAllCharacterQuery(),
    );
    if (response.isSuccessful) {
      Map<String, dynamic> characterMap =
          (response.data as Map<String, dynamic>)['data']['characters'];

      return (characterMap['results'] as List)
          .map((e) => CharacterModel.fromMap(e))
          .toList();
    }
    return null;
  }

  Future<List<CharacterDetailModel>?>
      fetchCharacterDetailWithPagination() async {
    final response = await apiCommunication.doPostRequest(
      apiEndPoint: '',
      query: getAllCharacterDetailsQuery(page: 1),
    );
    if (response.isSuccessful) {
      Map<String, dynamic> characterMap =
          (response.data as Map<String, dynamic>)['data']['characters'];

      return (characterMap['results'] as List)
          .map((e) => CharacterDetailModel.fromMap(e))
          .toList();
    }
    return null;
  }
}
