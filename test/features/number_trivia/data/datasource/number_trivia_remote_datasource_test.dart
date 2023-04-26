import 'dart:convert';

import 'package:clean_code_architecture_tdd/core/error/exceptions.dart';
import 'package:clean_code_architecture_tdd/features/number_trivia/data/datasources/number_trivia_remote_datasource.dart';
import 'package:clean_code_architecture_tdd/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'number_trivia_remote_datasource_test.mocks.dart';

import '../../../../fixtures/fixture_reader.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
void main() {
  late NumberTriviaRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = NumberTriviaRemoteDataSourceImpl(client: mockHttpClient);
  });
  group('getConcreteNumberTrivia', () {
    final tNumber = 1;
    final tNumberTriviaModel =
        NumberTriviaModel.fromJson(json.decode(fixture('trivia.json')));
    test(
        'should perform get request on url with number being the endpoint and application/json as header',
        () async {
      // arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(fixture('trivia.json'), 200));
      // act
      dataSource.getConcreteNumberTrivia(tNumber);
      // verify
      verify(mockHttpClient.get(Uri.parse('http://numbersapi.com/$tNumber'),
          headers: {'Content-Type': 'application/json'}));
    });

    test('should return NumberTrivia when the response code is 200 (success)',
        () async {
      // arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(fixture('trivia.json'), 200));
      // act
      final result = await dataSource.getConcreteNumberTrivia(tNumber);
      // verify
      expect(result, equals(tNumberTriviaModel));
    });
    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
            (_) async => http.Response('Something went wrong', 404));
        // act
        final call = dataSource.getConcreteNumberTrivia;
        // assert
        expect(() => call(tNumber), throwsA(TypeMatcher<ServerException>()));
      },
    );
  });

  group('getRandomNumberTrivia', () {
    final tNumberTriviaModel =
        NumberTriviaModel.fromJson(json.decode(fixture('trivia.json')));

    test(
      '''should perform a GET request on a URL with number
       being the endpoint and with application/json header''',
      () async {
        // arrange
        when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
            (_) async => http.Response(fixture('trivia.json'), 200));
        // act
        dataSource.getRandomNumberTrivia();
        // assert
        verify(mockHttpClient.get(
          Uri.parse('http://numbersapi.com/random'),
          headers: {
            'Content-Type': 'application/json',
          },
        ));
      },
    );

    test(
      'should return NumberTrivia when the response code is 200 (success)',
      () async {
        // arrange
        when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
            (_) async => http.Response(fixture('trivia.json'), 200));
        // act
        final result = await dataSource.getRandomNumberTrivia();
        // assert
        expect(result, equals(tNumberTriviaModel));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
            (_) async => http.Response('Something went wrong', 404));
        // act
        final call = dataSource.getRandomNumberTrivia;
        // assert
        expect(() => call(), throwsA(TypeMatcher<ServerException>()));
      },
    );
  });
}


// flutter pub run build_runner build                    