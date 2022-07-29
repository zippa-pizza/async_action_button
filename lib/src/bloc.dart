import 'package:flutter_bloc/flutter_bloc.dart';

class AsyncActionButtonBloc extends Cubit<bool> {
  AsyncActionButtonBloc() : super(false);

  Future<void> submit(Future<void> Function() onPressed) async {
    emit(true);

    await onPressed();

    emit(false);
  }
}
