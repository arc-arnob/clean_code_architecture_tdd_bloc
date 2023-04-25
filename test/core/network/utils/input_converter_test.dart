import 'package:clean_code_architecture_tdd/core/utils/input_converter.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late InputConverter inputConverter;

  setUp(() {
    inputConverter = InputConverter();
  });
  group('stringToUnsignedInt', () {
    test(
        'should return an Integer when a string represents an unsigned interger',
        () {
      final str = '123';
      final result = inputConverter.stringToUnsignedInteger(str);
      expect(result, Right(123));
    });

    test('should return an Faliure when a string is not an interger', () {
      final str = 'abc123@456';
      final result = inputConverter.stringToUnsignedInteger(str);
      expect(result, Left(InvalidInputFaliure()));
    });

    test('should return Faliure when the String is a Negative integer', () {
      final str = '-123';
      final result = inputConverter.stringToUnsignedInteger(str);
      expect(result, Left(InvalidInputFaliure()));
    });
  });
}
