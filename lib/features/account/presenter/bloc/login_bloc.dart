import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/error/failures.dart';
import 'package:movie_app/common/strings/failures.dart';
import 'package:movie_app/features/account/domain/usecase/login_usecase.dart';
import 'package:movie_app/features/account/presenter/bloc/login_event.dart';
import 'package:movie_app/features/account/presenter/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  final LoginUsecase loginUsecase;

  LoginBloc({required this.loginUsecase}) : super(LoginInitial()){
    on<LoginEvent>((event, emit) async {
      if(event is Login){
        emit(LoginLoading());
        final result = await loginUsecase(event.id);
        result.fold(
                (l) => emit(ErrorLoginState(message: _mapFailureToMessage(l))) ,
                (r) => emit(IsLogin(user: r))
        );
      }
    },
    );
  }

  String _mapFailureToMessage(Failure failure){
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error, Please try again later .';
    }
  }
}