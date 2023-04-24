import 'dart:convert';

import 'package:clean_code_architecture_tdd/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:clean_code_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'Test text');

  test(
    'should be a subclass of NumberTrivia entity',
    () async {
      expect(tNumberTriviaModel, isA<NumberTrivia>());
    },
  );
  group('fromJson', () {
    test('Should return a valid model when the JSON number is an integer',
        () async {
      // arrange
      // We want to get the fixture to simulate the JSON and convert it to Map
      final Map<String, dynamic> jsonMap = json.decode(fixture('trivia.json'));
      // act
      final result = NumberTriviaModel.fromJson(jsonMap);
      // assert
      expect(result, tNumberTriviaModel);
    });

    test('Should return a valid model when the JSON number is an double',
        () async {
      // arrange
      // We want to get the fixture to simulate the JSON and convert it to Map
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('trivia_double.json'));
      // act
      final result = NumberTriviaModel.fromJson(jsonMap);
      // assert
      expect(result, tNumberTriviaModel);
    });
  });

  group('toJson', () {
    test('Should return a valid model when the JSON number is an integer',
        () async {
      // act
      final result = tNumberTriviaModel.toJson();
      // assert
      final exectedMap = {"text": "Test text", "number": 1};
      expect(result, exectedMap);
    });
  });
}
