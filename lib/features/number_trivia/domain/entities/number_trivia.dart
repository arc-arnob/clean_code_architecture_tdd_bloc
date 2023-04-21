import 'package:equatable/equatable.dart';
/**
 * 
 * This code defines a Dart class called NumberTrivia that extends the Equatable
 *  class from the equatable package. The Equatable class helps to easily 
 * implement value-based equality in Dart.

The NumberTrivia class has two properties: text and number, both of which are 
required and of type String and int respectively. The class has a constructor 
that takes in the two required properties and initializes them.

The Equatable class requires the implementation of the props getter method 
which returns a list of properties that should be used to determine the 
equality of two instances of the class. In this case, the props getter 
method returns a list containing the text and number properties of the 
NumberTrivia class.

With this implementation, two instances of the NumberTrivia class will
be considered equal if they have the same text and number properties, which 
is useful for testing and comparison purposes.
 */

class NumberTrivia extends Equatable {
  final String text;
  final int number;

  NumberTrivia({
    required this.text,
    required this.number,
  });

  @override
  List<Object> get props => [text, number];
}
