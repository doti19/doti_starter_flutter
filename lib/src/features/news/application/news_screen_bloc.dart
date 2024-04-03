// import 'dart:async';

// import 'package:bloc_concurrency/bloc_concurrency.dart';
// import 'package:doti_starter/src/features/auth/domain/auth_failure.dart';
// import 'package:doti_starter/src/features/news/domain/news.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fpdart/fpdart.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:injectable/injectable.dart';

// part 'news_screen_bloc.freezed.dart';
// part 'news_screen_event.dart';
// part 'news_screen_state.dart';

// @injectable
// class NewsScreenBloc extends Bloc<NewsScreenEvent, NewsScreenState> {
//   NewsScreenBloc() : super(NewsScreenState.initial()) {
//     on<NewsScreenEvent>(
//       (event, emit) async {
//         await event.when(
//           fetchNews: () => fetchNews(emit),
//         );
//       },
//       transformer: droppable(),
//     );
//   }

//   FutureOr<void> fetchNews(
//     Emitter<NewsScreenState> emit,
//   ) {
//     emit(state.copyWith(
//       isLoading: true,
//     ));
//     // Simulate a network request
//     Future.delayed(const Duration(seconds: 2), () {
//       emit(state.copyWith(
//         isLoading: false,
//         news: [
//           News(
//             title: 'Flutter 2.5 is released!',
//             description:
//                 'Flutter 2.5 is released with new features and improvements.',
//           ),
//           News(
//             title: 'Flutter 2.6 is released!',
//             description:
//                 'Flutter 2.6 is released with new features and improvements.',
//           ),
//           News(
//             title: 'Flutter 2.7 is released!',
//             description:
//                 'Flutter 2.7 is released with new features and improvements.',
//           ),
//         ],
//       ));
//     });
//   }
// }
