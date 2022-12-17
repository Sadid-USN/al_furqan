import 'package:al_furqan/Feature/domain/entities/book_entity.dart';
import 'package:al_furqan/Feature/presentation/bloc/surahCubit/surah_list_cubit.dart';
import 'package:al_furqan/Feature/presentation/bloc/surahCubit/surah_list_state.dart';
import 'package:al_furqan/Feature/presentation/widgets/all_surahs_widget.dart';
import 'package:al_furqan/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../../common/assets.dart';

class SurahsListWidget extends StatelessWidget {
  const SurahsListWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<SurahListCubit, SurahState>(
      builder: (context, state) {
        List<BookModel> surahs = [];
        if (state is SurahLoading && state.isFirstFatch) {
          return GlowingProgressIndicator(
            child: SvgPicture.asset(
              height: double.maxFinite,
              width: double.maxFinite,
              Assets.basmala,
              color: Colors.white,
            ),
          );
        } else if (state is DataError) {
          return Center(
              child: Text(
            'الحَمْدُ لِلهِ عَلَى كُلِّ حَالٍ\n${state.message}',
            textAlign: TextAlign.center,
            style: GoogleFonts.vollkorn(
              color: Colors.white,
              fontSize: 25,
            ),
          ));
        } else if (state is SurahLoaded) {
          surahs = state.surahs;
        }
        return Padding(
          padding: const EdgeInsets.only(top: 16),
          child: ListView.separated(
            itemCount: surahs.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                color: AppColors.grayColor,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return AllSurahsWidget(
                surahs: surahs[index],
              );
            },
          ),
        );
      },
    ));
  }
}
