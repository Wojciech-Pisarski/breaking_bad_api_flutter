enum DbTables {
  FAVOURITE_EPISODES_TABLE,
  FAVOURITE_QUOTES_TABLE,
  FAVOURITE_CHARACTERS_TABLE,
}

const Map<DbTables, String> DbTablesStrings = {
  DbTables.FAVOURITE_EPISODES_TABLE: 'favourite_episodes',
  DbTables.FAVOURITE_QUOTES_TABLE: 'favourite_quotes',
  DbTables.FAVOURITE_CHARACTERS_TABLE: 'favourite_characters',
};

const Map<DbTables, String> DbColumnsStrings = {
  DbTables.FAVOURITE_EPISODES_TABLE: 'episode_id',
  DbTables.FAVOURITE_QUOTES_TABLE: 'quote_id',
  DbTables.FAVOURITE_CHARACTERS_TABLE: 'character_id',
};
