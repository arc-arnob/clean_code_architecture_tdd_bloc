import 'package:clean_code_architecture_tdd/core/platform/network_info.dart';
import 'package:clean_code_architecture_tdd/features/number_trivia/data/datasources/number_trivia_local_datsource.dart';
import 'package:clean_code_architecture_tdd/features/number_trivia/data/datasources/number_trivia_remote_datasource.dart';
import 'package:clean_code_architecture_tdd/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:clean_code_architecture_tdd/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:clean_code_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'number_trivia_repository_impl_test.mocks.dart';

// class MockRemoteDataSource extends Mock
//     implements NumberTriviaRemoteDataSource {}

// class MockLocalDataSource extends Mock implements NumberTriviaLocalDataSource {}

// class MockNetworkInfo extends Mock implements NetworkInfo {}
@GenerateNiceMocks([MockSpec<NumberTriviaRemoteDataSource>()])
@GenerateNiceMocks([MockSpec<NumberTriviaLocalDataSource>()])
@GenerateNiceMocks([MockSpec<NetworkInfo>()])
void main() {
  late NumberTriviaRepositoryImplementation repository;
  late MockNumberTriviaRemoteDataSource mockRemoteDataSource;
  late MockNumberTriviaLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockNumberTriviaRemoteDataSource();
    mockLocalDataSource = MockNumberTriviaLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = NumberTriviaRepositoryImplementation(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group('getConcreteNumberTrivia', () {
    final tNumber = 1;
    final tNumberTriviaModel =
        NumberTriviaModel(number: tNumber, text: 'Test Trvia');
    final NumberTrivia tNumberTrivia = tNumberTriviaModel;
    test('should check if the device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repository.getConcreteNumberTrivia(tNumber);
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getConcreteNumberTrivia(tNumber))
            .thenAnswer((_) async => tNumberTriviaModel);
        // act
        final result = await repository.getConcreteNumberTrivia(tNumber);
        // assert
        verify(mockRemoteDataSource.getRandomNumberTrivia());
      });
    });

    runTestsOffline(() {});
  });
}
