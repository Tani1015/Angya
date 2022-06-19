import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:angya/model/repositories/package_info/package_info_repository.dart';

final fetchAppNameProvider = Provider<String>((ref) => ref.read(packageInfoRepositoryProvider).appName);