// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:qr_generator_flutter/features/app_setting/app_setting_cubit.dart'
    as _i659;
import 'package:qr_generator_flutter/features/home/home_cubit.dart' as _i656;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i656.HomeCubit>(() => _i656.HomeCubit());
    gh.singleton<_i659.SettingsCubit>(() => _i659.SettingsCubit());
    return this;
  }
}
