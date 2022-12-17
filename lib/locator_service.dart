import 'package:al_furqan/Feature/data/datasources/surah_local_datasource.dart';
import 'package:al_furqan/Feature/data/datasources/surahs_remoute_datasource.dart';
import 'package:al_furqan/Feature/data/repositories/surah_repo_impl.dart';
import 'package:al_furqan/Feature/domain/repositories/surahs_repository.dart';
import 'package:al_furqan/Feature/domain/usecases/get_all_surahs.dart';
import 'package:al_furqan/Feature/presentation/bloc/surahCubit/surah_list_cubit.dart';
import 'package:al_furqan/core/platform/network_info.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Feature/presentation/bloc/detailSurahBloc/detail_surah_bloc.dart';
import 'Feature/presentation/bloc/detailSurahCubit/detail_surah_list_cubit.dart';
import 'Feature/presentation/bloc/surahBloc/surah_bloc.dart';
import 'Feature/presentation/bloc/surahBloc/surah_event.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Bloc Cubit
  sl.registerFactory(() => SurahListCubit(getAllSurahs: sl()));
  sl.registerFactory(() => SurahBloc(surahs: sl()));
  sl.registerFactory(() => DetailSurahListCubit(getDetailSurahs: sl()));
  sl.registerFactory(() => DetailSurahBloc(detail: sl()));

  //? UseCases
  sl.registerLazySingleton(() => GetAllSurahs(sl()));
  sl.registerLazySingleton(() => ListSurahsEvent(sl()));

  //! Repository
  sl.registerLazySingleton<SurahsRepository>(() => SurahRepositoryImpl(
        networkInfo: sl(),
        surahLocalDataSource: sl(),
        surahsRemoutDataSource: sl(),
      ));
  sl.registerLazySingleton<SurahsRemoutDataSource>(
      () => SurahsRemoutDataSourceImpl(client: http.Client()));

  sl.registerLazySingleton<SurahLocalDtataSource>(
      () => SurahLocalDataSourceImpl(sharedPreferences: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
