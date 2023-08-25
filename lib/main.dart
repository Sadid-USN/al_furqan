import 'package:al_furqan/Feature/presentation/bloc/detailSurahBloc/detail_surah_bloc.dart';
import 'package:al_furqan/Feature/presentation/bloc/surahCubit/surah_list_cubit.dart';
import 'package:al_furqan/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Feature/presentation/bloc/detailSurahCubit/detail_surah_list_cubit.dart';
import 'Feature/presentation/bloc/surahBloc/surah_bloc.dart';
import 'Feature/presentation/pages/hom_page.dart';
import 'locator_service.dart' as depinjection;
import 'locator_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await depinjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SurahListCubit>(
          create: (context) => sl<SurahListCubit>()..loadSurah(),
        ),
        BlocProvider<SurahBloc>(
          create: (context) => sl<SurahBloc>(),
        ),
        BlocProvider<DetailSurahListCubit>(
          create: (context) => sl<DetailSurahListCubit>()..detaiLoadSurah(),
        ),
        BlocProvider<DetailSurahBloc>(
          create: (context) => sl<DetailSurahBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
        
          backgroundColor: AppColors.mainBgColor,
          scaffoldBackgroundColor: AppColors.mainBgColor,
        ),
        home: const HomePage(),
      ),
    );
  }
}
