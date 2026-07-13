import 'package:bookly/Features/home/data/repo_impl/home_repo_impl.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly/Features/home/presentation/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'core/constants/strings.dart';
import 'core/utils/functions/setup_service_locator.dart';


void main() async{
  runApp(
      const Bookly());
  // Hive init
  await Hive.initFlutter();
  // register BookEntityAdapter
  Hive.registerAdapter(BookEntityAdapter());

  // open featured box that data will be cashed on
  await Hive.openBox<BookEntity>(kFeaturedBooksBox);
  await Hive.openBox<BookEntity>(kNewestBooksBox);

  Bloc.observer = SimpleBlocObserver();
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context){
              return FeaturedBooksCubit(featuredBooksUseCase:FetchFeaturedBooksUseCase(getIt.get<HomeRepoImpl>()));
            }
        ),
        BlocProvider(
            create: (context){
              return NewestBooksCubit(fetchNewestBooksUseCase: FetchNewestBooksUseCase(getIt.get<HomeRepoImpl>()));
            }
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
