import 'dart:async';
import 'dart:math';

import 'package:bloc_project_1/bloc/message_event.dart';
import 'package:bloc_project_1/bloc/message_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  // static final MessageModel Message = MessageModel(phone: "", email: "");
  // MessageBloc() : super(Init(Message));
  // late StreamSubscription<MessageModel> MessageSub;

  // Stream<MessageState> mapEventToState(MessageEvent event) async* {
  //   if (event is setEmail) {
  //     // yield setEmail(emailValue: event.);
  //   }
  // }

  MessageBloc() : super(Init()) {
    on<MessageEvent>((event, emit) {
      if (event is SetMessageEvent) {
        emit(SetValue(event.value));
      } 
      else {
        emit(Init());
      }
    });
  }
}


class MessageCubit extends Cubit<MessageState>{
  MessageCubit():super(Init());
  void setMessage(String value) =>emit(SetValue(value) );
}