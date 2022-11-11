// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/remote/http/api_provider.dart' as _i3;
import '../data/remote/http/base_http_client.dart' as _i4;
import '../data/remote/http/http_client.dart' as _i5;
import '../data/repositories/main_repository.dart' as _i6;

const String _dev = 'dev';

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiProvider>(_i3.ApiProvider());
    gh.factory<_i4.BaseHttpClient>(
      () => _i5.AppHttpClient(baseUrl: get<String>()),
      registerFor: {_dev},
    );
    gh.singleton<_i6.MainRepository>(
        _i6.MainRepository(get<_i3.ApiProvider>()));
    return this;
  }
}
