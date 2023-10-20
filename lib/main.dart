import 'package:bloc_project_1/bloc/message_bloc.dart';
import 'package:bloc_project_1/bloc/message_event.dart';
import 'package:bloc_project_1/bloc/message_state.dart';
import 'package:bloc_project_1/bloc/test_bloc/post_bloc.dart';
import 'package:bloc_project_1/bloc/test_bloc/post_event.dart';
import 'package:bloc_project_1/bloc/test_bloc/post_state.dart';
import 'package:bloc_project_1/painter/flags/singapore_flag.dart';
import 'package:bloc_project_1/painter/flags/thai_lan_flag.dart';
import 'package:bloc_project_1/painter/flags/viet_nam_flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/message_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<PostBloc>(
            create: (context) => PostBloc(),
          ),
          BlocProvider<MessageBloc>(
            create: (context) => MessageBloc()..add(SetMessageEvent("")),
          ),
          BlocProvider<MessageCubit>(
            create: (context) => MessageCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
              backgroundColor: Colors.grey,
              body: Center(
                child: CustomPaint(
                  painter: SingaporeFlag(),
                  size: Size(MediaQuery.sizeOf(context).width,
                      MediaQuery.sizeOf(context).width * 2 / 3),
                ),
              )),
        ));
  }
}

class MessagePage extends StatefulWidget {
  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final TextEditingController phone = TextEditingController(text: "");
  // final MessageBloc messageBloc = MessageBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("sdfsdfsd"),
      ),
      body: BlocBuilder<MessageCubit, MessageState>(
          // bloc: messageBloc,
          bloc: MessageCubit(),
          builder: ((context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: phone,
                    onChanged: ((value) {
                      if (value != null) {
                        // messageBloc.add(SetMessageEvent(value));
                        // MessageCubit().emit(SetValue(value));
                        context.read<MessageCubit>().setMessage(value);
                      }
                    }),
                    decoration: const InputDecoration(hintText: "Phone"),
                  ),
                  Text(
                    context.watch<MessageCubit>().state.content,
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
            );
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // messageBloc.add(SetMessageEvent(phone.text.trim()));
          Navigator.of(context).push(MaterialPageRoute(
            // builder: (_) => BlocProvider.value(
            //       value: BlocProvider.of<MessageCubit>(context),
            //       child: Page3(),
            //     )));
            builder: (_) => Page3(),
          ));
        },
        tooltip: 'go',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  Page3({super.key});
  // final PostBloc postBloc = PostBloc();
  @override
  Widget build(BuildContext context) {
    final state = context.watch<MessageCubit>().state.content;
    return Scaffold(
        // backgroundColor: Colors.black,
        body: BlocBuilder<MessageCubit, MessageState>(
            bloc: MessageCubit(),
            builder: ((context, a) {
              return Center(
                  child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.red,
                      child: Text(
                        "$state",
                        style: const TextStyle(color: Colors.black),
                      )));
            })));
  }
}

class PostPage extends StatefulWidget {
  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final PostBloc postBloc = PostBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostBloc, PostState>(
        bloc: postBloc,
        builder: (context, state) {
          if (state is LoadingPostsState) {
            postBloc.add(LoadPostsEvent());
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedPostsState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${state.list.length}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            );
          } else if (state is ErrorPostsState) {
            return Center(
              child: Text("Error: ${state.error}"),
            );
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<PostBloc>(context).add(LoadPostsEvent());
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => Page2(),
          ));
        },
        child: const Text("Go"),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  Page2({super.key});
  final PostBloc postBloc = PostBloc();
  @override
  Widget build(BuildContext context) {
    final state = context.watch<PostBloc>().state;
    return Scaffold(
      // body: BlocBuilder<PostBloc, PostState>(
      //     bloc: postBloc,
      //     builder: ((context, a) {
      //       return Center(child: Text("${state}"));
      //     })));
      body: Center(
          child:
              Text(context.watch<PostBloc>().state.listDate.length.toString())),
    );
  }
}
