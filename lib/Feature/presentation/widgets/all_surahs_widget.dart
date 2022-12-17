import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/app_colors.dart';
import '../../../common/assets.dart';
import '../../domain/entities/book_entity.dart';
import '../pages/surah_detail_page.dart';

class AllSurahsWidget extends StatelessWidget {
  final BookModel surahs;

  const AllSurahsWidget({
    Key? key,
    required this.surahs,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const SurahDetailPage();
        }));
      },
      child: ListTile(
        trailing: SvgPicture.asset(
          Assets.arabesque,
          height: 35,
          width: 35,
          color: Colors.white,
        ),
        title: Row(
          children: [
            Text(
              '${surahs.number}',
              style: const TextStyle(fontSize: 20, color: AppColors.grayColor),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${surahs.name}",
                    style: GoogleFonts.notoNaskhArabic(),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: 300,
                          child: Text(
                            "${surahs.englishName}  (${surahs.englishNameTranslation})",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "${surahs.revelationType} - ${surahs.numberOfAyahs} ayahs",
                    style: const TextStyle(
                        color: AppColors.grayColor, fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ],
        ),
        //  subtitle: Text("${surahs[index].name} "),
      ),
    );
  }
}
