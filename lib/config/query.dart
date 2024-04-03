String getAllCharacterQuery() {
  const String allCharacterQuery = '''
     query {
      characters(page:1) {
        results {
          id
          name
          image
        }
      }
    }
  ''';
  return allCharacterQuery;
}

String getAllCharacterDetailsQuery({required int page}) {
  String allCharacterQuery = '''
    query {
      characters(page:$page) {
        results {
          name
          status
          species
          gender
          origin {
            name
          }
          location {
            name
          }
          image
          episode {
            name
          }
        }
      }
    }
  ''';
  return allCharacterQuery;
}

String getAllLocationQuery() {
  const String allCharacterQuery = '''
    query {
      locations{
        results {
          id
          name
          type
          dimension
          created
        }
      }
    }
  ''';
  return allCharacterQuery;
}

String getAllEpisodeQuery() {
  const String allCharacterQuery = '''
    query {
      episodes{
        results {
            id
            name
            air_date
            episode
            created
        }
      }
    }
  ''';
  return allCharacterQuery;
}
