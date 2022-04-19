import 'failure.dart';

class DefaultFailure extends Failure {
  DefaultFailure({required String code, StackTrace? trace}) {
    title = '에러';
    content = '다시 시도해주세요.';
  }
}
