// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/features/data.dart';
import 'package:notes/src/features/domain.dart';
import 'package:notes/src/features/home/application/home_mapper.dart';
import 'package:notes/src/services/services.dart';

class HomeService {
  final Ref ref;
  HomeService({
    required this.ref,
  });

  Future<Result<HomeList>> getHomeList() async {
    final homeList = await ref.read(homeRepositoryProvider).getRestaurantList();
    return HomeMapper.mapToRestaurantList(homeList);
  }
}

final homeServiceProvider = Provider<HomeService>((ref) {
  return HomeService(
    ref: ref,
  );
});
