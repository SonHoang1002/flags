import 'dart:async';

import 'package:bloc_project_1/bloc/test_bloc/post_event.dart';
import 'package:bloc_project_1/bloc/test_bloc/post_state.dart';
import 'package:bloc_project_1/bloc/test_bloc/src/data_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(LoadingPostsState()) {
    on<LoadPostsEvent>((event, emit) async {
      // print("event load");
      if (event is LoadPostsEvent) {
        emit(LoadingPostsState());
        try {
          final posts = await DataService().getPosts();
          emit(LoadedPostsState(posts));
        } catch (e) {
          emit(ErrorPostsState(e));
        }
      }
    });
  }

// Stream<PostState> mapEventToState(PostEvent event) async* {
//     if (event is LoadPostsEvent) {
//       yield LoadingPostsState();
//       try {
//         final posts = await DataService().getPosts();
//         yield LoadedPostsState(posts);
//       } catch (e) {
//         yield ErrorPostsState(e);
//       }
//     }
//   }
// }
}
