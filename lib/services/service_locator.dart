import 'package:get_it/get_it.dart';

import '../data/api_provider.dart';
import '../data/repositories/game_repository.dart';

final GetIt locator = GetIt.instance;

void setUpDI() {
  locator.registerSingleton<GameRepository>(GameRepository());
  //locator.registerSingleton<GameRepository>(GameRepository.createEmpty());
  locator.registerSingleton<ApiProvider>(ApiProvider());
}
