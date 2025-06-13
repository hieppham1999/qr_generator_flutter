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
import 'package:logger/logger.dart' as _i974;
import 'package:qr_generator_flutter/data/data_store/qr_local_ds.dart' as _i606;
import 'package:qr_generator_flutter/data/database/qr_database.dart' as _i549;
import 'package:qr_generator_flutter/data/mapper/qr_view_data_mapper.dart'
    as _i386;
import 'package:qr_generator_flutter/data/repository/qr_repositories.dart'
    as _i826;
import 'package:qr_generator_flutter/di/injection.dart' as _i761;
import 'package:qr_generator_flutter/features/app_setting/app_setting_cubit.dart'
    as _i659;
import 'package:qr_generator_flutter/features/home/home_cubit.dart' as _i656;
import 'package:qr_generator_flutter/features/home/home_tab_cubit.dart'
    as _i720;
import 'package:qr_generator_flutter/features/qr_create/qr_create_cubit.dart'
    as _i593;
import 'package:qr_generator_flutter/features/scan_qr/qr_scan_cubit.dart'
    as _i1045;
import 'package:qr_generator_flutter/utils/app_logger.dart' as _i183;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final loggerModule = _$LoggerModule();
    gh.factory<_i593.QrCreateCubit>(() => _i593.QrCreateCubit());
    gh.factory<_i386.QrViewDataMapper>(() => _i386.QrViewDataMapper());
    gh.singleton<_i656.HomeCubit>(() => _i656.HomeCubit());
    gh.singleton<_i659.SettingsCubit>(() => _i659.SettingsCubit());
    gh.lazySingleton<_i549.QrDatabase>(() => _i549.QrDatabase());
    gh.lazySingleton<_i974.Logger>(
      () => loggerModule.devLogger,
      registerFor: {_dev},
    );
    gh.lazySingleton<_i974.Logger>(
      () => loggerModule.prodLogger,
      registerFor: {_prod},
    );
    gh.factory<_i826.QrRepository>(
      () => _i826.QrRepositoryImpl(gh<_i606.QrLocalDataSource>()),
    );
    gh.factory<_i1045.QrScanCubit>(
      () => _i1045.QrScanCubit(gh<_i826.QrRepository>()),
    );
    gh.factory<_i720.HomeTabCubit>(
      () => _i720.HomeTabCubit(gh<_i826.QrRepository>()),
    );
    gh.singleton<_i183.AppLogger>(() => _i183.AppLogger(gh<_i974.Logger>()));
    return this;
  }
}

class _$LoggerModule extends _i761.LoggerModule {}
