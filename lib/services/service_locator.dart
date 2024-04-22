import 'package:get_it/get_it.dart';

import '../data/repsitories/product_repository.dart';

var getIt = GetIt.I;

void setUp() {
  getIt.registerSingleton<ProductRepository>(ProductRepository());
}
