import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/failure.dart';
import 'package:movies/features/main_screen/tabs/home/domain/entities/movie_entity.dart';
import 'package:movies/features/main_screen/tabs/profile/data/data_sources/history_local_data_source.dart';
import 'package:movies/features/main_screen/tabs/profile/data/models/history_movie_model.dart';

@Injectable(as: HistoryLocalDataSource)
class HistoryLocalDataSourceImpl implements HistoryLocalDataSource {
  final FirebaseAuth firebaseAuth;

  HistoryLocalDataSourceImpl({required this.firebaseAuth});

  static const int _maxEntries = 50;

  Future<Box> _openBox() async {
    final uid = firebaseAuth.currentUser?.uid;
    if (uid == null) throw CacheFailure('No user is logged in');
    final boxName = 'history_$uid';
    if (Hive.isBoxOpen(boxName)) return Hive.box(boxName);
    return await Hive.openBox(boxName);
  }

  List<HistoryMovieModel> _parseEntries(Box box) {
    return box.values
        .whereType<Map>()
        .map((e) => HistoryMovieModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  @override
  Future<List<MovieEntity>> getHistory() async {
    try {
      final box = await _openBox();
      final entries = _parseEntries(box)
        ..sort((a, b) => b.viewedAt.compareTo(a.viewedAt));
      return entries;
    } catch (e) {
      if (e is CacheFailure) rethrow;
      throw CacheFailure(e.toString());
    }
  }

  @override
  Future<void> addToHistory(MovieEntity movie) async {
    try {
      final box = await _openBox();
      final key = movie.id.toString();
      await box.delete(key);
      await box.put(key, HistoryMovieModel.fromEntity(movie).toJson());
      if (box.length > _maxEntries) {
        final oldest = _parseEntries(box)
          ..sort((a, b) => a.viewedAt.compareTo(b.viewedAt));
        for (final e in oldest.take(box.length - _maxEntries)) {
          await box.delete(e.id.toString());
        }
      }
    } catch (e) {
      if (e is CacheFailure) rethrow;
      throw CacheFailure(e.toString());
    }
  }

  @override
  Future<void> removeFromHistory(MovieEntity movie) async {
    try {
      final box = await _openBox();
      await box.delete(movie.id.toString());
    } catch (e) {
      if (e is CacheFailure) rethrow;
      throw CacheFailure(e.toString());
    }
  }

  @override
  Future<void> clearHistory() async {
    try {
      final box = await _openBox();
      await box.clear();
    } catch (e) {
      if (e is CacheFailure) rethrow;
      throw CacheFailure(e.toString());
    }
  }
}
