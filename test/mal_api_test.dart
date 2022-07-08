import 'dart:io';
import 'package:test/test.dart';
import 'package:mal_api/mal_api.dart';

const _sampleAnimeId = 34798;
const _sampleMangaId = 14065;
const _sampleForumTopicId = 1715612;

late final Client _client;

void main() {
  setUpAll(() {
    _client
      = Client.fromJson(
        credentialsJson: Platform.environment['CREDENTIALS']!,
        id: Platform.environment['CLIENT_ID']!,
        secret: Platform.environment['CLIENT_SECRET']!
      );
  });

  test(
    'Get animes matching query',
    () async {
      final animes = await _client.getAnimeList('Yuru Camp', limit: 5);
      expect(animes.length, 5);
    }
  );

  test(
    'Get mangas matching query',
    () async {
      final mangas = await _client.getMangaList('Yuru Camp', limit: 5);
      expect(mangas.length, 5);
    }
  );

  test(
    'Get anime details',
    () async {
      await _addMyAnimeListItem();

      final anime
        = await _client.getAnimeDetails(
          _sampleAnimeId,
          fields: [
            AnimeField.alternativeTitles([
              AlternativeTitlesField.synonyms(),
              AlternativeTitlesField.en(),
              AlternativeTitlesField.ja()
            ]),
            AnimeField.averageEpisodeDuration(),
            AnimeField.background(),
            AnimeField.broadcast([
              BroadcastField.dayOfTheWeek(), BroadcastField.startTime()
            ]),
            AnimeField.createdAt(),
            AnimeField.endDate(),
            AnimeField.genres([GenreField.id(), GenreField.name()]),
            AnimeField.id(),
            AnimeField.mainPicture([
              PictureField.large(), PictureField.medium()
            ]),
            AnimeField.mean(),
            AnimeField.mediaType(),
            AnimeField.myListStatus([
              UserAnimeListStatusField.comments(),
              UserAnimeListStatusField.finishDate(),
              UserAnimeListStatusField.isRewatching(),
              UserAnimeListStatusField.numEpisodesWatched(),
              UserAnimeListStatusField.numTimesRewatched(),
              UserAnimeListStatusField.priority(),
              UserAnimeListStatusField.rewatchValue(),
              UserAnimeListStatusField.score(),
              UserAnimeListStatusField.startDate(),
              UserAnimeListStatusField.status(),
              UserAnimeListStatusField.tags()
            ]),
            AnimeField.nsfw(),
            AnimeField.numEpisodes(),
            AnimeField.numFavorites(),
            AnimeField.numListUsers(),
            AnimeField.numScoringUsers(),
            AnimeField.pictures([PictureField.large(), PictureField.medium()]),
            AnimeField.popularity(),
            AnimeField.rating(),
            AnimeField.rank(),
            AnimeField.recommendations([
              AnimeRecommendationField.node(),
              AnimeRecommendationField.numRecommendations()
            ]),
            AnimeField.relatedAnime([
              RelatedAnimeField.node(),
              RelatedAnimeField.relationType(),
              RelatedAnimeField.relationTypeFormatted()
            ]),
            AnimeField.relatedManga([
              RelatedMangaField.node(),
              RelatedMangaField.relationType(),
              RelatedMangaField.relationTypeFormatted()
            ]),
            AnimeField.source(),
            AnimeField.startDate(),
            AnimeField.startSeason([
              StartSeasonField.season(), StartSeasonField.year()
            ]),
            AnimeField.statistics([
              StatisticsField.numListUsers(),
              StatisticsField.status([
                StatisticsStatusField.completed(),
                StatisticsStatusField.dropped(),
                StatisticsStatusField.onHold(),
                StatisticsStatusField.planToWatch(),
                StatisticsStatusField.watching()
              ])
            ]),
            AnimeField.status(),
            AnimeField.studios([StudioField.id(), StudioField.name()]),
            AnimeField.synopsis(),
            AnimeField.title(),
            AnimeField.updatedAt()
          ]
        );

      expect(anime.alternativeTitles != null, true);
      expect(anime.alternativeTitles?.synonyms != null, true);
      expect(anime.alternativeTitles?.en != null, true);
      expect(anime.alternativeTitles?.ja != null, true);
      expect(anime.averageEpisodeDuration != null, true);
      expect(anime.background != null, true);
      expect(anime.broadcast != null, true);
      expect(anime.broadcast?.dayOfTheWeek != null, true);
      expect(anime.broadcast?.startTime != null, true);
      expect(anime.createdAt != null, true);
      expect(anime.endDate != null, true);
      expect(anime.genres != null, true);
      expect(
        anime.genres?.every((g) => g.id != null && g.name != null), true
      );
      expect(anime.id != null, true);
      expect(anime.mainPicture != null, true);
      expect(anime.mainPicture?.large != null, true);
      expect(anime.mainPicture?.medium != null, true);
      expect(anime.mean != null, true);
      expect(anime.mediaType != null, true);
      expect(anime.myListStatus?.comments != null, true);
      expect(anime.myListStatus?.finishDate != null, true);
      expect(anime.myListStatus?.isRewatching != null, true);
      expect(anime.myListStatus?.numEpisodesWatched != null, true);
      expect(anime.myListStatus?.numTimesRewatched != null, true);
      expect(anime.myListStatus?.priority != null, true);
      expect(anime.myListStatus?.rewatchValue != null, true);
      expect(anime.myListStatus?.score != null, true);
      expect(anime.myListStatus?.startDate != null, true);
      expect(anime.myListStatus?.status != null, true);
      expect(anime.myListStatus?.tags != null, true);
      expect(anime.nsfw != null, true);
      expect(anime.numEpisodes != null, true);
      expect(anime.numFavorites != null, true);
      expect(anime.numListUsers != null, true);
      expect(anime.numScoringUsers != null, true);
      expect(anime.pictures != null, true);
      expect(
        anime.pictures?.every(
          (picture) => picture.large != null && picture.medium != null
        ),
        true
      );
      expect(anime.popularity != null, true);
      expect(anime.rating != null, true);
      expect(anime.rank != null, true);
      expect(anime.recommendations != null, true);
      expect(
        anime.recommendations?.every(
          (r) => r.node != null && r.numRecommendations != null
        ),
        true
      );
      expect(anime.relatedAnime != null, true);
      expect(
        anime.relatedAnime?.every(
          (a) => a.node != null
            && a.relationType != null
            && a.relationTypeFormatted != null
        ),
        true
      );
      expect(anime.relatedManga != null, true);
      expect(
        anime.relatedManga?.every(
          (a) => a.node != null
            && a.relationType != null
            && a.relationTypeFormatted != null
        ),
        true
      );
      expect(anime.source != null, true);
      expect(anime.startDate != null, true);
      expect(anime.startSeason != null, true);
      expect(anime.startSeason?.season != null, true);
      expect(anime.startSeason?.year != null, true);
      expect(anime.statistics != null, true);
      expect(anime.statistics?.numListUsers != null, true);
      expect(anime.statistics?.status?.completed != null, true);
      expect(anime.statistics?.status?.dropped != null, true);
      expect(anime.statistics?.status?.onHold != null, true);
      expect(anime.statistics?.status?.planToWatch != null, true);
      expect(anime.statistics?.status?.watching != null, true);
      expect(anime.status != null, true);
      expect(anime.studios != null, true);
      expect(
        anime.studios?.every((s) => s.id != null && s.name != null) != null,
        true
      );
      expect(anime.synopsis != null, true);
      expect(anime.title != null, true);
      expect(anime.updatedAt != null, true);
    }
  );

  test (
    'Get manga details',
    () async {
      await _addMyMangaListItem();

      final manga
        = await _client.getMangaDetails(
          _sampleMangaId,
          fields: [
            MangaField.alternativeTitles([
              AlternativeTitlesField.synonyms(),
              AlternativeTitlesField.en(),
              AlternativeTitlesField.ja()
            ]),
            MangaField.authors([
              AuthorField.node([
                AuthorNodeField.firstName(),
                AuthorNodeField.id(),
                AuthorNodeField.lastName()
              ]),
              AuthorField.role()
            ]),
            MangaField.background(),
            MangaField.createdAt(),
            MangaField.endDate(),
            MangaField.genres([GenreField.id(), GenreField.name()]),
            MangaField.id(),
            MangaField.mainPicture([
              PictureField.large(), PictureField.medium()
            ]),
            MangaField.mean(),
            MangaField.mediaType(),
            MangaField.myListStatus([
              UserMangaListStatusField.comments(),
              UserMangaListStatusField.finishDate(),
              UserMangaListStatusField.isRereading(),
              UserMangaListStatusField.numChaptersRead(),
              UserMangaListStatusField.numTimesReread(),
              UserMangaListStatusField.numVolumesRead(),
              UserMangaListStatusField.priority(),
              UserMangaListStatusField.rereadValue(),
              UserMangaListStatusField.score(),
              UserMangaListStatusField.startDate(),
              UserMangaListStatusField.status(),
              UserMangaListStatusField.tags(),
            ]),
            MangaField.nsfw(),
            MangaField.numChapters(),
            MangaField.numFavorites(),
            MangaField.numListUsers(),
            MangaField.numScoringUsers(),
            MangaField.numVolumes(),
            MangaField.pictures([
              PictureField.large(), PictureField.medium()
            ]),
            MangaField.popularity(),
            MangaField.rank(),
            MangaField.recommendations([
              MangaRecommendationField.node(),
              MangaRecommendationField.numRecommendations()
            ]),
            MangaField.relatedAnime([
              RelatedAnimeField.node(),
              RelatedAnimeField.relationType(),
              RelatedAnimeField.relationTypeFormatted()
            ]),
            MangaField.relatedManga([
              RelatedMangaField.node(),
              RelatedMangaField.relationType(),
              RelatedMangaField.relationTypeFormatted()
            ]),
            MangaField.serialization([
              SerializationField.node([
                SerializationNodeField.id(), SerializationNodeField.name()
              ]),
              SerializationField.role()
            ]),
            MangaField.startDate(),
            MangaField.status(),
            MangaField.synopsis(),
            MangaField.title(),
            MangaField.updatedAt()
          ]
        );

      expect(manga.alternativeTitles != null, true);
      expect(manga.alternativeTitles?.en != null, true);
      expect(manga.alternativeTitles?.ja != null, true);
      expect(manga.alternativeTitles?.synonyms != null, true);
      expect(manga.authors != null, true);
      expect(
        manga.authors?.every(
          (author) => author.node?.firstName != null
            && author.node?.id != null
            && author.node?.lastName != null
            && author.role != null
        ),
        true
      );
      expect(manga.background != null, true);
      expect(manga.createdAt != null, true);
      expect(manga.endDate != null, true);
      expect(manga.genres != null, true);
      expect(
        manga.genres?.every(
          (genre) => genre.id != null && genre.name != null
        ),
        true
      );
      expect(manga.id != null, true);
      expect(manga.mainPicture != null, true);
      expect(manga.mainPicture?.large != null, true);
      expect(manga.mainPicture?.medium != null, true);
      expect(manga.mean != null, true);
      expect(manga.mediaType != null, true);
      expect(manga.myListStatus?.comments != null, true);
      expect(manga.myListStatus?.finishDate != null, true);
      expect(manga.myListStatus?.isRereading != null, true);
      expect(manga.myListStatus?.numChaptersRead != null, true);
      expect(manga.myListStatus?.numTimesReread != null, true);
      expect(manga.myListStatus?.numVolumesRead != null, true);
      expect(manga.myListStatus?.priority != null, true);
      expect(manga.myListStatus?.rereadValue != null, true);
      expect(manga.myListStatus?.score != null, true);
      expect(manga.myListStatus?.startDate != null, true);
      expect(manga.myListStatus?.status != null, true);
      expect(manga.myListStatus?.tags != null, true);
      expect(manga.nsfw != null, true);
      expect(manga.numChapters != null, true);
      expect(manga.numFavorites != null, true);
      expect(manga.numListUsers != null, true);
      expect(manga.numScoringUsers != null, true);
      expect(manga.numVolumes != null, true);
      expect(manga.pictures != null, true);
      expect(
        manga.pictures?.every(
          (picture) => picture.large != null && picture.medium != null
        ),
        true
      );
      expect(manga.popularity != null, true);
      expect(manga.rank != null, true);
      expect(manga.recommendations != null, true);
      expect(
        manga.recommendations?.every(
          (r) => r.node != null && r.numRecommendations != null
        ),
        true
      );
      expect(manga.relatedAnime != null, true);
      expect(
        manga.relatedAnime?.every(
          (a) => a.node != null
            && a.relationType != null
            && a.relationTypeFormatted != null
        ),
        true
      );
      expect(manga.relatedManga != null, true);
      expect(
        manga.relatedManga?.every(
          (a) => a.node != null
            && a.relationType != null
            && a.relationTypeFormatted != null
        ),
        true
      );
      expect(manga.serialization != null, true);
      expect(
        manga.serialization?.every(
          (serialization) => serialization.node?.id != null
            && serialization.node?.name != null
            // Unable to get MAL API to return role despite being documented in
            // the API, thus we'll leave it commented out for now
            // && serialization.role != null
        ),
        true
      );
      expect(manga.startDate != null, true);
      expect(manga.status != null, true);
      expect(manga.synopsis != null, true);
      expect(manga.title != null, true);
      expect(manga.updatedAt != null, true);
    }
  );

  test(
    'Get top ranked animes',
    () async {
      final animes
        = await _client.getAnimeRanking(
          AnimeRankingType.all,
          limit: 5,
          fields: [
            AnimeRankingField.node(),
            AnimeRankingField.ranking([
              RankingField.previousRank(), RankingField.rank()
            ])
          ]
        );

      expect(animes.length, 5);
      expect(animes.every(
        (anime) => anime.ranking?.rank != null
          // Unable to get MAL API to return previous rank despite being
          // documented in the API, thus we'll leave it commented out for now
          // && anime.ranking?.previousRank != null
      ), true);
    }
  );

  test(
    'Get top ranked mangas',
    () async {
      final mangas
        = await _client.getMangaRanking(
          MangaRankingType.all,
          limit: 5,
          fields: [
            MangaRankingField.node(),
            MangaRankingField.ranking([
              RankingField.previousRank(), RankingField.rank()
            ])
          ]
        );

      expect(mangas.length, 5);
      expect(mangas.every(
        (anime) => anime.ranking?.rank != null
          // Unable to get MAL API to return previous rank despite being
          // documented in the API, thus we'll leave it commented out for now
          // && anime.ranking?.previousRank != null
      ), true);
    }
  );

  test(
    'Get animes airing in a season',
    () async {
      final animes
        = await _client.getSeasonalAnime(2018, Season.winter, limit: 5);

      expect(animes.length, 5);
    }
  );

  test(
    'Get anime suggestions',
    () async {
      final animes = await _client.getSuggestedAnime(limit: 5);
      expect(animes.length, 5);
    }
  );

  test(
    'Update my anime list status',
    () async {
      final original = _getSampleUserAnimeListStatus();
      final response
        = await _client.updateMyAnimeListStatus(_sampleAnimeId, original);

      expect(response.comments, original.comments);
      expect(response.finishDate, original.finishDate);
      expect(response.isRewatching, original.isRewatching);
      expect(response.numEpisodesWatched, original. numEpisodesWatched);
      expect(response.numTimesRewatched, original.numTimesRewatched);
      expect(response.priority, original.priority);
      expect(response.rewatchValue, original.rewatchValue);
      expect(response.score, original.score);
      expect(response.startDate, original.startDate);
      expect(response.status, original.status);
      expect(response.tags, original.tags);
    }
  );

  test(
    'Update my manga list status',
    () async {
      final original = _getSampleUserMangaListStatus();
      final response
        = await _client.updateMyMangaListStatus(_sampleMangaId, original);

      expect(response.comments, original.comments);
      expect(response.finishDate, original.finishDate);
      expect(response.isRereading,  original.isRereading);
      expect(response.numChaptersRead, original.numChaptersRead);
      expect(response.numTimesReread, original.numTimesReread);
      expect(response.numVolumesRead, original.numVolumesRead);
      expect(response.priority, original.priority);
      expect(response.rereadValue, original.rereadValue);
      expect(response.score, original.score);
      expect(response.startDate, original.startDate);
      expect(response.status, original.status);
      expect(response.tags, original.tags);
    }
  );

  test(
    'Delete item from my anime list',
    () async {
      await _addMyAnimeListItem();

      await _client.deleteMyAnimeListItem(_sampleAnimeId);

      Anime anime
        = await _client.getAnimeDetails(
          _sampleAnimeId, fields: [AnimeField.myListStatus()]
        );
      expect(anime.myListStatus, null);
    }
  );

  test(
    'Delete item from my anime list',
    () async {
      await _addMyMangaListItem();

      await _client.deleteMyMangaListItem(_sampleMangaId);

      Manga manga
        = await _client.getMangaDetails(
          _sampleMangaId, fields: [MangaField.myListStatus()]
        );
      expect(manga.myListStatus, null);
    }
  );

  test(
    'Get my anime list',
    () async {
      await _addMyAnimeListItem();
      List<Anime> animes = await _client.getUserAnimeList(limit: 1);
      expect(animes.length, 1);
    }
  );

  test(
    'Get my manga list',
    () async {
      await _addMyMangaListItem();
      List<Manga> mangas = await _client.getUserMangaList(limit: 1);
      expect(mangas.length, 1);
    }
  );

  test(
    'Get my user information',
    () async {
      await _client.getUserInformation();
    }
  );

  test(
    'Get forum boards.',
    () async {
      final categories = await _client.getForumBoards();
      expect(
        categories.every(
          (category) => category.title != null
            && category.boards != null
            && category.boards!.every(
              (board) => board.description != null
                && board.id != null
                && board.title != null
                && board.subboards != null
                && board.subboards!.every(
                  (subboard) => subboard.id != null && subboard.title != null
                )
            )
        ),
        true
      );
    }
  );

  test(
    'Get forum topic details.',
    () async {
      final topic
        = await _client.getForumTopicDetail(_sampleForumTopicId, limit: 5);

      expect(topic.poll?.closed != null, true);
      expect(topic.poll?.id != null, true);
      expect(topic.poll?.options != null, true);
      expect(
        topic.poll?.options!.every(
          (option) => option.id != null
            && option.text != null
            && option.votes != null
        ),
        true
      );
      expect(topic.poll?.question != null, true);
    }
  );

  test(
    'Get forum topics',
    () async {
      final forumTopics
        = await _client.getForumTopics(limit: 5, q: 'Yuru Camp', subboardId: 1);

      expect(
        forumTopics.every(
          (topic) => topic.createdAt != null
            && topic.createdBy?.id != null
            && topic.createdBy?.name != null
            && topic.id != null
            && topic.isLocked != null
            && topic.lastPostCreatedAt != null
            && topic.lastPostCreatedBy?.id != null
            && topic.lastPostCreatedBy?.name != null
            && topic.numberOfPosts != null
            && topic.title != null
        ),
        true
      );
    }
  );
}

Future<void> _addMyAnimeListItem() async {
  await _client.updateMyAnimeListStatus(
    _sampleAnimeId, _getSampleUserAnimeListStatus()
  );
}

UserAnimeListStatus _getSampleUserAnimeListStatus() => UserAnimeListStatus(
  comments: 'sample comment',
  finishDate: DateTime.parse('2018-03-22'),
  isRewatching: false,
  numEpisodesWatched: 12,
  numTimesRewatched: 0,
  priority: 2,
  rewatchValue: 5,
  score: 10,
  startDate: DateTime.parse('2018-01-04'),
  status: WatchStatus.completed,
  tags: ['Sample', 'Tag'],
);

Future<void> _addMyMangaListItem() async {
  await _client.updateMyMangaListStatus(
    _sampleMangaId, _getSampleUserMangaListStatus()
  );
}

UserMangaListStatus _getSampleUserMangaListStatus() => UserMangaListStatus(
  comments: 'sample comment',
  finishDate: DateTime.parse('2020-11-24'),
  isRereading: false,
  numChaptersRead: 142,
  numTimesReread: 0,
  numVolumesRead: 24,
  priority: 2,
  rereadValue: 5,
  score: 10,
  startDate: DateTime.parse('2020-11-20'),
  status: ReadStatus.completed,
  tags: ['Sample', 'Tag'],
);
